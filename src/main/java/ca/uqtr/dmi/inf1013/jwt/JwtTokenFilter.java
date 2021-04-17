package ca.uqtr.dmi.inf1013.jwt;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.impl.JWTParser;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.google.common.base.Strings;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.crypto.SecretKey;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class JwtTokenFilter extends OncePerRequestFilter {
    private final SecretKey secretKey;
    private final JwtConfig jwtConfig;

    public JwtTokenFilter(SecretKey secretKey,
                            JwtConfig jwtConfig) {
        this.secretKey = secretKey;
        this.jwtConfig = jwtConfig;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest req,
                                    HttpServletResponse rep,
                                    FilterChain filterChain) throws ServletException, IOException {
System.out.println("DoFilterInternal");

        String auth = req.getHeader(jwtConfig.getAuthorizationHeader());
        if(Strings.isNullOrEmpty(auth) || !auth.startsWith(jwtConfig.getTokenPrefix())){
            filterChain.doFilter(req, rep);
        }else {
            String token = auth.replace(jwtConfig.getTokenPrefix(), "");
            // voir https://github.com/auth0/java-jwt
            try {
                Algorithm algorithm = Algorithm.HMAC256(String.valueOf(secretKey));
                JWTVerifier verifier = JWT.require(algorithm)
                        .withIssuer("MyApp")
                        .build();
                DecodedJWT jwt = verifier.verify(token);
                String username = jwt.getSubject();
                Authentication authentication =
                        new UsernamePasswordAuthenticationToken(username, null, null);
                SecurityContextHolder.getContext().setAuthentication(authentication);
                filterChain.doFilter(req, rep);
            } catch (JWTVerificationException exception) {
                exception.printStackTrace();
                //rep.sendError(HttpServletResponse.SC_FORBIDDEN);
                throw new RuntimeException(exception.getMessage());
            }
        }

    }
}
