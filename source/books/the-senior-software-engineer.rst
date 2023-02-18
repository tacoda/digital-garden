****************************
The Senior Software Engineer
****************************

.. epigraph::
   These are notes, lessons, and takeaways from `The Senior Software Engineer`_

.. _The Senior Software Engineer: https://www.goodreads.com/en/book/show/18215039

Focus on Delivering Results
===========================

.. epigraph::
   A senior software engineer is trusted and expected to do the most important work and to do it reliably. The way to accomplish that is to focus everything you do on the delivery of results.

- Results
- Focus
- Deliver smaller results more often
- Plans, schedules, and status reports

Fix Bugs Efficiently and Cleanly
================================

1. Understand the problem.
2. Write tests that fail (because the problem has yet to be solved).
3. Solve the problem as quickly as you can, using your tests to know when you’ve solved it.
4. Modify your solution for readability,conciseness,and safety by using your tests to make sure you haven’t broken anything.
5. Commit your changes.

.. mermaid::

   flowchart LR
    A(Understand the Problem) --> B(Write Failing Test)
    B --> C(Solve Problem to Make Test Pass)
    C --> D(Refactor Solution)
    D --> E(Commit Changes)

Thinking before coding.

Separating “getting it to work” from “doing it right”. It’s hard to do both at the same time.

Understand the Problem
----------------------

These notions are very much in line with our focus on delivering results, however they can often be misinterpreted as
“just start coding”.

By rushing into coding up a solution, you run the risk of solving the wrong problem, or wasting time pursuing a partial solution. Any work you do to solve the wrong problem is wasted effort that must be undone. Further, the amount of time required to re-do the work later is orders of magnitude higher than taking a bit of time now to understand what you need to do.

These issues can easily be addressed by taking a breath and thinking for a few moments. “No Big Design Up Front” doesn’t mean “No Design” any more than “code wins arguments” means “coding is the only activity worth doing”.

If you’re fixing a bug, the easiest way to understand the problem is to actually use the buggy software and see the problem yourself. Even if you think you know the exact line of code where the problem occurs, actually seeing the bug as a user would can be hugely insightful. It may turn out that the line of code you thought you’d have to change is perfectly correct and some other part of the system is doing something wrong.

**Roadblocks**

- Misunderstanding the problem
- No access to the production system
- No access to project stakeholders
- An acutal emergency or business priority
- Pressure to immediately start coding

Write Tests That Fail
---------------------

- Automated testing
- Write tests first

**Roadblocks**

- There is no existing test suite
- No infrastructure for tests at the "level" you need to test

Solve the Problem as Quickly as You Can
---------------------------------------

With tests failing, you should now get them to pass as expediently as you can. Don’t spend a lot of time pondering the “right” solution or making things “elegant”. Just get the system working.

**Roadblocks**

If you do any pair programming, your pair might take is- sue with your tactic of coding without regard to cleanliness, style, or maintainability. Simply remind your pair that once things are working, you can use the test suite to keep things working while you clean everything up.

Modify Your Code for Maintainability and Readability
----------------------------------------------------

- No copy and paste code
- Descriptive variable names
- Coding style should match the existing code

Don't over-engineer and know when to quit.

Refactoring is restructuring an existing body of code, altering its internal structure without changing its external behavior

**Roadblocks**

When pair-programming, this step might result in more discussion. This can be a good thing since if two programmers can agree that a particular refactoring is good, chances are it is.

Commit Your Changes
-------------------

The first line of your commit message should state, as briefly and specifically as possible, what the change is.

Add Features with Ease
======================

1. Understand the problem
2. Understand the system
3. Create acceptance-level tests for the feature
4. Plan your implementation
5. Repeat the cycle from the previous chapter until all your acceptance-level tests pass
6. Get a code review
7. Commit your changes

.. mermaid::

   flowchart LR
    A(Understand the Problem) --> B(Understand the System)
    B --> C(Acceptance-Level Tests)
    C --> D(Plan Implementation)
    D --> E(Acceptance Test Failing)
    E --> TDD
    subgraph TDD
    F(Unit Test Failing) --> G(Unit Test Passing)
    G --> H(Code Refactored)
    H --> F
    end
    TDD --> I(Acceptance Test Passing)
    I --> J(Code Review)
    J --> K(Commmit Changes)

Understand the Problem
----------------------

If you have not been given a UI mockup or are expected to produce the UI on your own, schedule two meetings with your user/stakeholder: one to talk through the business problem, and a second to talk through the UI. If you are new to creating UI mockups, just keep it simple. Often a drawing on a piece of paper is sufficient to work out how something should look, but there are many web-based and desktop tools to create UI mockups.

**Roadblocks**

- Stakeholder is not available/accessible

Understand the System
---------------------

Now that you understand the business problem you are solving and the way in which the user will interact with the system to do so, you need to develop a system view of the application you’ll need to modify.

- What domain objects will this feature need to interact with?
- What business rules exist around those objects?
- What structures are in place to manage those objects?
- What new objects will you need to create?
- What is the test coverage like? Will you need to add test coverage anywhere before making changes?
- Are there any offline tasks related to these objects?
- Is there special reporting or auditing on the changes related to these objects, and should your new objects be a part of this?
- Are there non-functional requirements to consider, such as performance or security?

**Roadblocks**

- Pressure to immediately start coding

Create Acceptance-Level Tests
-----------------------------

An acceptance test simulates a user using the feature as closely as possible (i.e. the user is “accepting” that the feature works as desired). For example, in a web-based application, your acceptance tests might launch a web browser that exercises parts of the application.

When you start coding, your focus will change from the high-level view you have now to a lower-level view of the code. The acceptance tests can let you quickly figure out where you are when you put your head up from the code. Think of them as an executable “todo” list.

The main goal is to test that the features outlined in the requirements you were given are all working as intended. You don’t need to cover every esoteric edge case (although you should certainly exercise some), but you want all the “happy paths” to be covered end-to-end.

**Roadblocks**

- No acceptance-level tests exist in the system
- Perception that acceptance tests are the job of QA

Plan Your Implementation
------------------------

Given that this feature is more complex than a bugfix, it means that there are many ways to go about it, and the best way might not become apparent just from coding.

If you take a moment to imagine the system with the new feature implemented, you can quickly cut off avenues of development that won’t work out. By plotting out your work before starting, you’ll also be more likely to re-use existing code in the system, and produce a cleaner solution.

You aren’t looking to generate some detailed publishable documentation. In fact, your “plan” might be developed entirely in your head. The point is to think a bit about how you’re going to get this task done and create a mental roadmap of how it will work.

Exactly how to go about this is highly dependent on your work style. Some developers like to-do lists, others like to put comments in the code where they need to make changes, while others will draw before/after system flow diagrams.

Do whatever you need to visualize and understand the steps you’ll take. If you cannot explain to another developer how you’re going to solve this problem or what the state of the system will be after you’re done, you are ill-equipped to start coding.

The best approach to getting a solid plan in place is to actually do that: discuss it with another developer. Find your nearest co-worker (or technical lead) and talk them through your approach. This can save quite a bit of time since any errors in your approach won’t otherwise get caught until code review, where the cost of change is higher.

Whatever you do, resist the urge to publicize your plan. This plan is not a result you are delivering and doing so is a promise you can’t (or shouldn’t) keep. Certain types of project managers would love to see something like this, so they could check off the tasks and derive some sort of “percent complete” for your feature.

**Roadblocks**

- Pressure to start coding immediately
- Unable to create a plan or mental model

TDD Cycle
---------

**Work in Small Steps**

The advantage to working in such small steps is that when you inevitably realize something you missed, or when you go down the wrong path, you’ll know it quickly. You can either reverse course or make whatever changes to your plan you need, knowing that you’ve spent the least amount of time possible working on the wrong thing.

Update your plan only as necessary. Often, the plan itself is disposable; merely creating it is sufficient. Your plan’s value was in getting started but, if you feel that updating it as you learn more about what you need to do is helpful, by all means do so. Just don’t treat it as a work product that must reflect how you actually implemented this change.

**Work Clean**

Clean as you go. Reafactor and clean up what you've done at the end of each step.

**Roadblocks**

- Overwhelmed with complexity

### Get a Code Review

**Preparing the Review**

Your request for a code review should have two parts: guid- ance from you and the diff of your changes. Tools like Github make this very simple, as you can submit a pull request, and provide review guidance there.

Your guidance should help the reviewer know where to start. Although you are intimately familiar with this set of changes, remember that the reviewer is coming in cold.

First, you want to summarize what the feature is and what problem it solves in just a few short sentences. You should also provide a link to the detailed requirements for reference, but it’s important to summarize things right in the review so the reviewer doesn’t have to go hunting down a longer document.

If your solution is complex, you might spend a few sentences summarizing your general approach, so the reviewer understands your thinking. Next, you should list, in order, the classes/files that the reviewer should read to understand the change. If you aren’t sure how to do this, just start with the UI portion, and trace things down to the back-end. The idea is to guide the reviewer so you get good feedback and not questions about where things are.

**Responding to Feedback**

- Incorrect
- Confusing
- Style/aesthetic

**Incorporating Feedback**

If you end up needing to make changes to the code based on the review, make those as a separate diff so that the reviewer can see just the changes you’ve made, and not have to re-review the entire thing.

**Roadblocks**

- No-one to review/non-substantive review
- Persistent discussions on style/approach

Commit Your Changes
-------------------

How to Report Progress
----------------------

With simple bugfixes, there’s typically no expectation to report progress; either you’re working on the bugfix or it’s done. Here, you might be working for several days or even weeks, depending on the complexity of the task. Simply stating that you are “in progress” isn’t helpful and project stakeholders deserve more visibility.

That being said, you don’t want to indicate some percentage complete, or some number of hours left to work if you can help it. Instead, report progress as a status, based on where you are in the process:

- In steps one through four, if you haven’t started coding, your status is “understanding the problem”.
- In step five, your status is “coding” or “in progress”. While it’s OK to describe how far along you are within this step, resist making promises. A lot can happen in just a few hours’ coding. A good tactic here is to comment on the feature in your feature management system (or report at a regular status meeting if your team does them) with what you’ve done or what you plan to work on next, but with no indication of any level of completeness. This demonstrates progress, but without setting expectations.
- In steps six and seven, your status is “in review”.

Deal with Technical Debt and Slop
=================================

Slop: Code to Fix Now
---------------------

The tests pass, and the feature technically works, but it’s less than ideal. Not only have you copied code from somewhere else, you’ve modified it slightly so the duplicated business logic isn’t apparent. Anyone creating future features related to discounting and store credit will have to change both of these blocks of code, assuming they realize that both duplicate the same business logic. Further, the variable code is not very well-named.

Many developers, if they are feeling pressured to complete their work, would call this an acceptable compromise, promise to fix it later, and ship it. This code is slop and, as a senior developer, you shouldn’t ship it. You only need a few minutes to clean it up, which will save much more time than that down the road.

That being said, there are still some issues with this code. Does discounting logic really belong in the Product class? It’s a convenient place to put it, but it seems out of place. If a future feature needs to calculate a discount, but doesn’t have a Product instance, it’s going to be hard to re-use this logic. Imaginary features like this can lead to over-engineering and the phrase “You Aren’t Gonna Need It” can keep your imagination in check.

Still, what if such a feature did come up? It’s hard to argue that our code is now slop simply because of a new requirement. The reality is that we made a design decision based on the state of the world at the time and, if world changes, our once clean code would make it difficult to change the system. This is a form of technical debt.

Technical Debt: Code to Fix Later
---------------------------------

Although this code is clean and shippable, it incurs technical debt. The second we run a promotion outside the US, this code breaks. What’s important about this code is that we’ve called it out as technical debt.

The annotated comment is a message to other developers that we weren’t being lazy, but that we knowingly did something less than ideal because we needed to ship. Also note that the annotated comment includes a test for when this code must be fixed.

Further, since comment is annotated with TECHDEBT:, you can run static analysis of the codebase (or simply do a text search on it) to bring up a list of technical debts you’ve incurred.

It’s also important that this information is in a code comment and not just in the commit message. We want developers reading this code to immediately see that, not only is this code technical debt, but why the debt had to be incurred. A developer isn’t going to be guaranteed to chase through the commit history to find out why this code is written this way, assuming the developer even asks the question.

Play Well With Others
=====================

Empathize With Your Audience
----------------------------

Your manager, other users, project stakeholders, or even your team lead need to apply your expertise to a problem. This is the essence of being a software engineer. Typically, these “interested parties” understand the problem more deeply than you, but lack the technical knowledge, skill, or time to solve it directly. They also have their own sets of priorities and constraints, most of which you won’t be aware of.

This is the position your managers and other company decision-makers are in. Not only do they not know how to do what you do, but they often don’t even have the vocabulary to know what to ask for. Further, they likely don’t know what they don’t know and will have a lot of wrong assumptions about what software development is. Finally, their priorities and job pressures won’t be obvious to you, but will play a big role in how they approach you to help solve a problem.

This isn’t necessarily a fault on their part, however. Not everyone can know everything in great detail. Instead of thinking of them as “pointy-haired bosses”, think of them as partners. They understand the problem and you know how to solve it. This “division of labor” is why teams can achieve greater things than any individual.

That being said, not everyone operates from the same set of priorities. Part of the reason that the first step in writing code from the previous chapters was to “understand the problem” is to make sure that the results you’re being asked to deliver are actually valuable.

Part of your job is to push back when you’re being asked to solve the wrong problem. Often, having the types of discussions we’re talking about here can help you identify the real underlying problem your team needs to solve. It’s often not what you’ve been initially asked to do.

Adapt and Extract Information
-----------------------------

**Adapt Terms**

- Avoid technical jargon of your own. At best, your audience won’t understand the words you’re using at all. Worse, they’ll think they understand the meaning of a common word that actually means something completely different.
- Listen carefully to the words people use and ask questions if you aren’t 100% sure what they mean. You might feel silly asking such questions, but you’ll feel a lot sillier when you can’t get your point across.
- Don’t “talk down”. The other person is likely a highly intelligent person who is capable of understanding what you’re explaining. Treating them like a child will only make things worse.
- Don’t be afraid to use longer descriptive phrases in place of acronyms or other jargon. For example, you might prefer to use the phrase “the list of users waiting to be activated” instead of “the user-ack queue”.

**Abstract Concepts to Simplify Them**

- Avoid technical details.
- Explain things using analogies; don’t worry about precision.
- Use diagrams, visual aids, or demonstrations where possible.
- Always offer top rovide more details.
- If a question has taken you off course, spend a few seconds re-establishing the context of your discussion. For example, “OK, so we were talking about how the files we get from the shipping vendor are placed on their private FTP site, and our background job downloads them every hour. The next step is. . . ”
- Be prepared to “justify” your position if challenged. Do this by gradually increasing the level of detail. This is especially important if you are delivering “bad news”.

Make Technical Decisions
========================

Identify Facts
--------------

Facts (more formally, “propositions”) are pieces of information about the topic of discussion that can be verified. Facts are not up for debate (although their importance certainly is; we’ll get to that). For example, “Java is a compiled language” is a fact, whereas, “compilation slows down the development process” is not (nor is “compilation speeds up the development process”).

Of course, the facts you must consider aren’t always so cut and dried. Consider the phrase “the development team feels that compilation slows them down”. Although it’s not clear that compilation is actually slowing the team down (and thus is not a fact), it’s true that the team has this particular feeling. You could easily verify it by polling the members of the team in question. If a majority feel that compilation slows them down, then you’ve identified a fact about the team, not about compilation.

Opinions like this are often indicators of hidden facts that you have yet to identify. Ideally, you can replace facts about a team or person’s feelings with facts about the matter at hand.

Identify Priorirites
--------------------

Priorities are a list of what’s important to someone, either in general, or with respect to the decision at hand. For example, one of your boss’ priorities might be to hire as many competent developers as possible to help the company grow. You will use the priorities of everyone involved in a decision to give weight to the various facts you’ve identified.

In a sense, priorities themselves are facts and all we’re doing is using inferences to draw conclusions, however I find the distinction here useful. Facts, in the way I’m describing them here, are about things whereas priorities are about people. Because of this, it can be easy to overlook priorities, since they are more difficult to ascertain than simply reading documentation or playing around with code.

Explicitly identifying priorities can make your decisions, and the discussion around them, more straightforward than aimlessly arguing about the importance of the various facts. Even if you are just making a decision on your own, identifying priorities is a good “gut check”.

Draw Conclusions
----------------

As mentioned, each priority gives weight to the importance of the facts. For each fact, ask yourself how much it matters to you, given your priorities. Do the same for each person whose priorities you’ve identified, e.g. how much would the boss really care about the fact that Haskell allows pure functional programming?.

Hopefully, you’ll have identified facts that speak to everyone’s priorities and lead everyone to the same conclusion. If that’s the case, your job is mostly done. If not, this means that some priorities are conflicting. Resolving these conflicts should be the subject of an in-person discussion and it should be highly focused because of all the legwork you’ve done.

Fallacies
---------

- Hasty Generalization
- Straw Man
- No True Scotsman
- Composition
- Correlation Does Not Imply Causation
- False Equivalence
- Appeal to Authority

Document the Decision-Making Process
------------------------------------

Once a decision is made, and you are moving forward, I find it useful to jot down why the decision was made. Hopefully you have a shared documentation space, such as a wiki, where something like this can go. Even if you don’t, keep this written artifact around.

It doesn’t need to be anything grandiose or formalized. You can likely just list the facts and priorities and summarize the discussion around those priorities.

Bootstrap a Greenfield System
=============================

A greenfield project has two main goals:

- Make sure everyone involved in the project feels good about the initial direction and decisions being made
- Establish a location for developers to start contributing code

1. Understand the problem
2. Understand the system’s place in the existing technical architecture
3. Choose the technology
4. Outline application architecture
5. Create a deployment checklist
6. Build and deploy a minimum deployable system
7. Add features, deploying after each one is complete

Understand the Problem
----------------------

To understand why the application should be built, find answers to these questions:

- What business problems will this application solve?
- Why is the proposed application the best solution to those problems?
- What other solutions were considered?

**Roadblocks**

- No clear answers
- Clear ansers that you disagree with

Understand the System's Place in the Technical Architecture
-----------------------------------------------------------

- What is it called?
- What is its purpose?
- What technologies does it use?
- Who is the point of contact for it?
- Which development team is responsible for it?
- What other applications does it depend on?

For the dependent applications:

- Will these systems need to change to accommodate yours?
- If so, how will these changes be made? Do you need to coordinate with the other team, or can you simply make the needed changes yourself?
- Will you need to run these systems in development to run your application or is there a shared development instance you can use?

Choose Technology
-----------------

**Using the Blessed Stack**

