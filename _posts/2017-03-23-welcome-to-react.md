---
layout: post
title:  "TIL, 2017-03-23: Welcome to React"
date:   2017-03-23 08:21:19 +0800
categories: programming
---

- Grok webpack now hehe.
- [Create react app.](https://github.com/facebookincubator/create-react-app) then `npm start`
- `package.json` has stuff there that you can tinker, the `scripts` part contains scripts you can run via `npm ACTION` (ex: `"start": "PORT=3006 react-scripts start"`).
- ES6: Constructor, that is where you set React initial state.
- Gitlab code, testing module inclusion: `it { is_expected.to include_module(Mentionable) }`
- Gitlab code, testing caches:

      it 'caches the author' do
        user = create(:user, email: commit.author_email)
        expect(RequestStore).to receive(:active?).twice.and_return(true)
        expect_any_instance_of(Commit).to receive(:find_author_by_any_email).and_call_original

        expect(commit.author).to eq(user)
        key = "commit_author:#{commit.author_email}"
        expect(RequestStore.store[key]).to eq(user)

        expect(commit.author).to eq(user)
        RequestStore.store.clear
      end

- React way of thinking, though stuck on two parts: How to do presenter type stuff in a Component, and sharing state across components.
- Doing an `Enumerable.map` with a conditional inside then `Enumerable.compact` is like the same as `Enumerable.select`.
- Elixir package manager: hex.
