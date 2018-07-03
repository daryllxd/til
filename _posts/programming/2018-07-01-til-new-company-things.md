---
layout: post
title:  "TIL, 2018-07-01, New Company Things"
date:   2018-07-01 16:43:38 +0800
categories: programming
summary: "Lessons, China"
---

# Ask HN: What is the first thing you implement at a new company?
[Reference](https://news.ycombinator.com/item?id=17353854)

- I take a humble listening position, even if I immediately see things I want to fix. It's easier to fix processes and code once you have good rapport with the team.
  - Never rewrite your code from scratch, because most "ugliness" comes from bug fixes that people encountered along the way.
  - The ability to create positive change was strongly correlated to me taking the time to ask people questions, heeding their warnings, leveraging their unique insights, and giving their contrasting opinions credit.
  - Unless you've been hired to help change their dev practices, you can go with what they have until you've got some understanding and reputation to start suggestion changes to how things work.
- Document everything you did (permissions, dev env setup, subscriptions).
- "Good morning" to everyone!
- As a PM:
  - Try to break the product.
  - Find the person who support customers, ask them what makes their jobs suck and what's broken.
  - Meet dev team, chat about why the product matters, gauge their interest and understanding of the problem and customers.
  - Figure out what the common threads are.
- Debugger, backup, AWS vault.
- Internal URL shortening?

# Ask HN: Of your hard learned lessons, which do you wish could've been easier?
[Reference](https://news.ycombinator.com/item?id=16983434)

- Take care of health.
- Not have a fear of other people.
- Recognize abusive behaviors and assholes.
- Getting better at interviews.
- Cutting people off. Telling people they aren't your friends anymore. Even if it hurts at first.
- Eliminating bullshit.
- Being right is overrated.
- Materialism is overrated.
- Do not be attached to anything that can be lost in a ship-wreck.
- Do many things.
- Focus on living a good life. Focusing on work to much is a surefire path to burnout and hating yourself. Define success mostly in terms of what you do outside of work.
- It's okay to not have kids.
- Better to have a small number of close friends rather than acquaintances.
- Start fewer projects to get more things done.
- Give yourself time to think without influence or corruption.
- You'll almost never regret a travel experience.
- Be nicer. Statistically, it pays off well.

# The shortest path is the scariest
[Reference](https://medium.com/gusto-engineering/the-shortest-path-is-the-scariest-77ff94248334)

- Engineering, product, and design team.
- We must:
  - Continuously identify the next most important thing we should be solving for our customers.
  - Understand roughly the cost/benefits of solving the problem.
  - Find the optimal set of tradeoffs between product scope/engineering costs in solving the problem.
- High confidence in cost, high confidence in value: do this.
- Deliberate retrospective: "What could we have learned faster this week, given what we knew at the time?"
- Ambiguity is better stored in documents than people's minds.

# Designing New Ways to Give Context to News Stories
[Reference](https://medium.com/facebook-design/designing-new-ways-to-give-context-to-news-stories-f6c13604f450)

- "Related articles": these act as a strong signal to help determine the credibility and accuracy of that story. We want to enable people to get similar context across a number of situations.
- Credibility signals: publisher's name, how long the publisher has been around, which of their trusted friends and family also read this source.
- Source credibility: reporter's style, facial expressions, and choice to topics are additional social signals about news-related info.
- Conducting interviews in the lab and in the field, looking at differences in ways that people assessed the information.
- Because people are distracted when using FB, we need to help people find the entry point and communicate its value.
  - Face of the friend, group, or Page who shared the post.
  - Faces in the articles' preview image.
  - The headline of the article.
- Discoveries:
  - People care deeply about being able to trust the news they see on FB.
  - People want a quick and easy way to evaluate information in their News Feed.
- Article Comments:
  - Re-introducing number of shares and "x family member liked it" reinforces the social bubbles that exist.

# The Path to Becoming a Software Architect
[Reference](https://medium.com/@nvashanin/the-path-to-becoming-a-software-architect-de53f1cb310a)

- Architect: An expert who makes high-level design choices and dictates technical standards, including coding standards, tools, and platforms.
- Characteristics:
  - Communication. Charisma, involves in the discussion making process.
  - Broad and deep technical knowledge (and in different stacks). Tech documentation, reports, and diagrams.
  - Responsibility. The decisions you make can cost a lot.
  - Stress resistance.
  - Management skills.
  - Analytic skills.
- The goals for the next few months:
  - Understand and try several tech stacks.
  - Reading literature.
  - Mentors.
  - Courses, and the lecturer should be a professional than can answer questions.

# The 10 Operating System Concepts Software Developers Need to Remember
[Reference](https://medium.com/the-aspiring-programmer-journal/the-10-operating-system-concepts-software-developers-need-to-remember-480d0734d710)

- Operating system: a collection of software that manages computer hardware and provides services for programs.
  - It hides hardware complexity, manages computational resources, and provides isolation and protection.
- Elements:
  - Abstractions (process, thread, file, socket, memory).
  - Mechanisms (create, schedule, open, write, allocate).
  - Policies (LRU, EDF).
- Design principles:
  - Separation of mechanism and policy by implementing flexible mechanisms to support policies.
  - Optimize for the common case.
- Types of OSes:
  - Monolithic: Entire OS is working in kernel space and is alone in supervisor mode.
  - Modular OS: Some part of the system core will be located in independent files called modules.
  - Micro OS: Where the kernel is broken down into separate processes, known as servers.
- ***Processes and Process Management***
  - The execution of a process must progress in a sequential fashion. Executing a program = it becomes a process which performs all the tasks mentioned in the program.
- When a program is loaded into the memory and it becomes a process, it can be divided into four sections:
  - Stack: contains the temporary data such as method/function parameters, return address, and local variables.
  - Heap: Dynamically allocated memory to a process during its run time.
  - Text: the current activity represented by the value of the Program Counter.
  - Data: the section containing the global and static variables.
- Process state:
  - Start.
  - Ready. Waiting to be assigned to a processor. Ready processes are waiting to have the processor allocated to them by the OS so that they can run.
  - Running.
  - Waiting. Waiting for user input or a file to be available.
  - Terminated/exit.
- Info needed to keep track of a process:
  - Process state.
  - Process privileges.
  - Process ID. (PID)


# How does Chinese tech stack up against American tech?
[Reference](https://www.economist.com/business/2018/02/15/how-does-chinese-tech-stack-up-against-american-tech)

- Alibaba and Tencent: Same level (market value) as Alphabet and Facebook.
- 2x e-commerce, 11x money sending.
- China wants to lead globally in AI by 2030.
- In e-commerce and the Internet, Chinese firms are collectively 53% as big as Americas.
- China has a lot of data and companies in AI specialisms (facial recognition and speech).
- China is expected to catch up in 10-15 years.

## HN Comments

- Ebooks, payment systems.
- China stops rentiers from stifling innovation. Corruption that threatens national growth will not be tolerated. America: rentier class (old school media, publishers, ISPs, banks).
