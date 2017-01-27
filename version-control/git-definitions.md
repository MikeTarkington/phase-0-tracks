# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

Version control helps us collaborate, or even just work independently, on our code while taking great measures to protect the main files.  It gives uss save points we can revert to if something goes wrong.  It provides a system for managing various versions and integrating them together safely while such that they don't break the code.  It empowers contributors to be creative and experiment with thier versions of the code before it is absorbed into the final product.

* What is a branch and why would you use one?

A branch gives users the ability to take the main code base and edit it without immediate consequence.  If the modifications made in a branch are deemed valuable they can be merged back into the code base to improve it.  Alternatvely, users might develop in a completely different directoin from the code base and create something now using the foundation.

* What is a commit? What makes a good commit message?

A commit is the action of accepting an update to files or folders within the repo.  The message is important because it's an opportunity to indicate the changes made in the commit.  It helps identify points at which the project made certain changes.

* What is a merge conflict?

A merge conflict occurs when a file(s) being integrated with a current working branch changes something that Git cannot figure out how to merge on its own.  This may occur in varius situations like when to people edit the same file on the same line or delete files that were only modified by another person.  Git notifies us of conflicts and then we provide it instruction on how to resolve the issue.