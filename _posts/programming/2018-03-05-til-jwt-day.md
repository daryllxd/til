---
layout: post
title:  "TIL, 2018-03-05. JWT day."
date:   2018-03-05 13:42:11 +0800
categories: programming
summary: "JWT day, just shipping stuff regardless, and connecting React."
---

## Musings

- `rake secret`
- [`ActiveModel::StrictValidation`](https://www.51degrees.net/2012/02/27/strict-validations-in-activemodel.html) is raised if you have `strict: true` in the validator re: Rails and the validation is violated.
- SSL/TLS: Transport Layer Security.
- JWT created must have other things in the payload. If not, all tokens will look the same?
- [OAuth vs JWT](https://stackoverflow.com/questions/38689395/relationship-between-oauth-and-jwt)
  - OAuth2 is an authorization framework used by third party applications to access resources on a resource server without exposing user password.
  - JWT is a way to represent claims to be transferred between two parties.
  - OAuth2 can use JWT as an exchange token.
  - JWT allows you to access the resources you want without going through an authentication procedure. Steps:
    - Authenticate the user.
    - If correct credentials, log in the application while creating a JWT token from the credential.
    - Send the token to the user. He can use the token to request every time he logs in the application.
- Ruby's `fetch` really needs that second argument to not run into `RuntimeErrors`.
- `cal-heatmap` library in JavaScript to create a cool heatmap!
- [You can use Lambdas in Case Statements in Ruby.](http://aalvarez.me/blog/posts/using-lambdas-in-case-statements-in-ruby.html)
- I'm also now looking into `dry-validation`. Wow this is actually so smart.

## An Introduction to Using JWT Authentication in Rails
[Reference](https://www.sitepoint.com/introduction-to-using-jwt-in-rails/)

- JWT (pronounced "jot"): JWTs carry information (claims) via JSON.
- Header (type of token, hashing algorithm used), payload (types), signature.
- Integration with Devise: Create a `JsonWebToken` class.

``` ruby
class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.secrets.secret_key_base)[0])
  rescue
    nil
  end
end
```

- Basically: User signs in credentials, we create a `WebToken` (not persisted in the database) that is related to that user.

``` ruby
def payload(user)
  return nil unless user and user.id
  {
    auth_token: JsonWebToken.encode({user_id: user.id}),
    user: {id: user.id, email: user.email}
  }
end
```

## OAuth2 vs JSON Web Tokens: How to Secure an API
[Reference](http://www.seedbox.com/en/blog/2015/06/05/oauth-2-vs-json-web-tokens-comment-securiser-un-api/)

- JWT is an authentication protocol.
  - The private key in the JWT should only be known by the server-side.
  - Use case: Service Oriented Architecture, we can access user session information on a server that has no access to your systems' user/session DB.
  - Pros: Fast dev, no cookies needed, JSON can be used by mobile, no social login dependency.
  - Limitations: Token size limit, tokens cannot be revoked, and requires tokens to have a short expiration.
- OAuth2 is an authentication framework.
  - Multiple different roles, users, server-side apps, clients can authenticate with each other.
  - Role: Resource owner, resource server, client application, authorization server.
  - Client types: Confidential, public.
  - Client profiles: Web app, user agent, native.
  - Authorization grants: Authorization code, implicit, password, client credentials.
  - Endpoints: Authorization, token, and redirection.
  - Use case: Outsourcing the authentication to another site (!).
- You first need SSL/HTTPS security. This encrypts the data that is sent along the wire, from the browser to the server.

## 7 Best Practices for JSON Web Tokens
[Reference](https://dev.to/neilmadden/7-best-practices-for-json-web-tokens)

- Take time to learn about the underlying security properties. Check Coursera Crypto course.
- You can probably apply 2?
- Key management = weakest part. Consider using a Hardware Security Module, or use Vault/Amazon KMS.
- Rotate keys, depending on usage volumes.
- High-quality source of random data for generating keys.
- Rotate keys suspected of compromise and stop trusting any JWTs using that key.
- Headless JWT? Remove everything up to the first "." character, then reconstruct the JWT with a fixed header for the known algorithm/parameters and prepend it to the JWT.
- Be careful when using encryption and compression together. Not just a theoretical vulnerability, this information can leak.
- Consider JWT lifetime.
  - Blacklist JWTs based on a unique ID.
  - Short-lived JWTs and require them to be re-issued regularly, via OAuth2 refresh token flow.
  - Use JWTs to identify resources and some minimal state, while storing the majority of data on the server.
- Read the security considerations.

## dqwd
[Reference](https://dev.to/yos/stateless-authentication-with-json-web-tokens--km3)

- Benefits of Using JWTs for Authentication
  - Fine grained access control, your claims can have a dynamic set of scopes.
  - A JSON web token carries a header-like metadata that can be easily inspected for client-side validation.
  - Expire: Use the expire claim.
  - Stateless: All information is contained.
  - Ideally, encrypt with AES.
  - You can ALSO perform client side validation on the `exp` expiry time claim to invalidate an expired token.
- Revoking tokens:
  - Add TLS/SSL for client-server and intra-service communication.
  - We can use Redis to store a token's identifier.
  - We can revoke JWTs belonging to a user by signing JTWs by having each user have their own secret. Then, you can revoke based

https://dev.to/yos/stateless-authentication-with-json-web-tokens--km3
