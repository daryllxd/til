---
layout: post
title:  "TIL, 2018-05-13, Byzantine Generals Problem and Other Crypto Things."
date:   2018-05-13 17:50:14 +0800
categories: programming
summary: "Reading on Sharding, Event Sourcing, Parallel queries."
---

# Musings, Ruby

- [Octopus - Easy Database Sharding for ActiveRecord](https://github.com/thiagopradi/octopus): Sharding/replication gem.
- [Event Sourcing](https://www.reddit.com/r/rails/comments/8j2uxk/an_introduction_to_event_sourcing_for_rubyists/): Also cool.
- [Postgres has parallel queries?](https://www.postgresql.org/docs/10/static/parallel-query.html)

# Musings, Blockchain/Bitcoin

- [Decentralized consensus](https://medium.com/orbs-network/why-decentralized-consensus-blockchain-is-good-for-business-5ff263468210) Decentralized consensus can be chosen to choose highest bids of things. In order to do business, inhabitants have to trust one another. They have no reason to trust one another, because they prioritize their own personal interests. This lack of trust brings the system to a stalemate, where the inhabitants either don't do business together, or are forced to work in a way where the majority is not truly happy.
- [Byzantine Generals' Problem](https://medium.com/all-things-ledger/the-byzantine-generals-problem-168553f31480)
  - Centralized vs decentralized vs distributed: Centralized: one central authority. Decentralized: multiple servers who receive messages from one central server. Distributed: each node is connected to every other node and has the exact same authority.
  - BGP problem: how do you find consensus or make sure that everything is correct? Consensus = agreeing upon every message transmitted in the network.
- [Bitcoin and money transfer.](https://www.finder.com/international-money-transfers/blockchain)
  - Cryptocurrency was created so you wouldn't have to trust any central institution.
  - It is easy to transfer bitcoin, but if you need to go back to fiat, it's slowed by financial institutions. If speed is what you're after, you just send a wire transfer through your bank.
  - Exchange rates make currency conversion expensive, and bitcoin exposes you to them twice.
  - The blockchain was created to take over the fiat system.
