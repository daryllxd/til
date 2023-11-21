---
layout: post
title:  "TIL, 2023-11-20"
date:   2023-11-20 14:19:49 +0800
categories: programming
summary: "Where I..."
---

# What is Authentication?
[Reference](https://auth0.com/intro-to-iam/what-is-authentication)

- Auth is usually username/password.
- Another factor: instead of something you know (password), it must be something you have (a phone), or something you are (biometric).
- Passwordless authentication.

# What is OAuth 2.0?
[Reference](https://auth0.com/intro-to-iam/what-is-oauth-2)

- Authorization, not authentication protocol - grants access to a set of resources.
- Roles:
  - Resource owner - who owns the roles.
  - Client - who requires access to the resources.
  - Authorization server - server receives requests from the client for access tokens and issues them upon successful authentication and consent by the Resource owner.
  - Resource server - a server that protects the user's resources and receives access requests.

## Steps

- Client requires auth from the server - supplying id and secret as identification.
- Authorization server authenticates the client and verifies that the requested scopes are permitted.
- Resource owner interacts with authorization server to grant access.
- Authorization server redirects back to the client with either an Auth code or access token, depending on the grant type. + a potential refresh token.
- With the token, client requests access to the resource from the Resource server.

## Grant types:

- Authorization code - return a single-use authorization code to the client, which is then exchanged for an access token.
- Implicit - return access token.
- Authorization code grant with Proof Key for Code Exchange - similar to Authorization code grant, but with steps to make it more secure.

# What is SAML 2.0?
[Reference](https://auth0.com/intro-to-iam/what-is-saml)

- SAML = Security Assertion Markup Language. Allows a user to authenticate in a system and gain access to another system by providing proof of their authentication.
- SAML uses XML to represent the user's identity data and simple HTTP for data transport.
- Identity providers exchange digitally signed XML documents (SAML Assertions) allowing the end-user to access a Service Provider.
- Service requesting/receiving data from the provider - Relying Party.
- Benefits:
  - SAML makes systems interoperability possible.
  - Single point of authentication.
