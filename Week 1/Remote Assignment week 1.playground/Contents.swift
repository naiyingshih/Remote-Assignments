//: # Part 1: Git & GitHub
//: ## 1-2.
/*:
 a. git status:
 
 - Meaning - displays the status of changes as untracked, modified, or staged
 - Use case - check the current state of the repository

 b. git diff:
 
 - Meaning - show differences between working directory
 - Use case - view the changes you made in current and previous working directory

 c. git add: 
 
 - Meaning - stages change for the next commit
 - Use case - tell git to include the change of the file in the next commit

 d. git reset: 
 
 - Meaning - resets changes in the working directory or staging area to a specific commit
 - Use case - un-stage the changes if you already execute “git add” but not commit yet (back to the stage you modified file)

 e. git commit: 
 
 - Meaning - record the changes you staged, and write into the repository to be like a snapshot of project’s history
 - Use case - saving staged changes to a commit

 f. git log: 
 
 - Meaning - display a list of commits in the project
 - Use case - check most recent commits to view the commit history (including author, date, commit message and other details)

 g. git branch: 
 
 - Meaning - managing branches by create, list, or deletes...etc.
 - Use case - view all branches in the repository, and show which branch you are currently in

 h. git merge: 
 
 - Meaning - integrates changes from one branch into another
 - Use case - use to merge changes, so you can combine the work done in these two branches

 i. git push [ repo_name ] [ branch_name ]: 
 
 - Meaning - to upload changes from local ([branch_name]) to remote ([repo_name])
 - Use case - syncing changes between local and remote repo

 j. git remote: 
 
 - Meaning - manage connections to remote repositories
 - Use case - list the remote repository which is connected to your local repository

 k. fork:
 
 - Meaning - create a copy of a repository from other authors
 - Use case - you can take entire copy of others’ repo, and clone it in your own personal user place to modify anything locally

 l. (Advanced) git rebase: 
 
 - Meaning - modify the commit history of a branch by moving a sequence of commits to the specific base branch
 - Use case - incorporating changes from one branch into another, then history can look cleaner

 m. (Advanced) git cherry-pick: 
 
 - Meaning - select the commits you want from one branch and use them at another branch without merging the whole branch
 - Use case - selectively integrate changes

 n. (Advanced) git reflog: 
 
 - Meaning - provide a list of the history for recent change reference  (include branches, hashes, HEAD and commit message)
 - Use case - viewing historical changes to references

 o. (Advanced) git tag: 
 
 - Meaning - list all tags in the repository, which are the static references that mark specific commit points.
 - Use case - create a reference to a specific commit, such as a milestones
 */
//: ## 1-3.
/*: Establish a GitHub repo:

 - Open terminal, use “git init” to create a new Git repository, along with a hidden directory (.git)

 - Open GitHub home page, find the block “Start a new repository”, enter the name of repository and click the button “Create a new repository”. You can also create readme.md file and license by following steps.

 Upload the local projects to GitHub:

 - After all the changes are add to commit (by git add and git commit), use “git push -u <remote_branch> <local_branch>” to push the local repo to GitHub (remote repo). You have to enter username and password at the first time.

 - If you want to upload your repo back to the original source, then you can use “Pull request” on GitHub.
 */
//: # Part 2: Basic
//: ## 2-1.
/*:
 - let: use to define a constant, and its value cannot be changed after it is set.

 - var: use to define a variable, and its value is allowed to change after it is set.
 */
//: ## 2-2.
let pi: Double = 3.14

//let radius: Double = 10.0
//let circumference = 2 * radius * pi
//: ## 2-3.
let x: Int = 60
let y: Int = 70

let average = (x + y)/2
//: ## 2-4-1.
//change data type form Int to Double, then you can put changeAverageType to system
let changeAverageType = Double(average)
//: ## 2-4-2.
10/3
10.0/3.0
//: The result from (10/3) would be an interger since the data type is Int, while (10.0/3.0) would come out a result with decimal point since the data type is Double.
//: ## 2-5.
let a = 10
let b = 3

let remainder = a % b
//: ## 2-6.
var flag: Bool = true
var inputString: String = "Hello world."
let bitsInBite: Int = 8
let averageScore: Double = 86.8
//: ## 2-7.
/*:
 Type Inference: Swift can identify the data type of a variable without defining type annotations.
 
 For example, var x: Int = 10 equals to var x = 10
 */
//: ## 2-8.
//: variable phoneNumber has already been declared to type Int in this case, so you cannot assign anothor phoneNumber value which is not type Int. ("Hello world" is type String)
//:
//: ## 2-9.
var salary = 22000
salary += 28000
//: ## 2-10.
//: Equality operator: ==
//:
//: # Part 3: Collection
//: ## 3-1.
var myFriends: [String] = []
//: ## 3-2.
myFriends += ["Ian", "Bomi", "Kevin"]
//: ## 3-3.
myFriends.append("Michael")
//: ## 3-4.
myFriends.swapAt(0, 2)
//: ## 3-5.
for myFriend in myFriends {
    print(myFriend)
}
//: ## 3-6.
//To find the value of specific index, you can check the count of the array first
myFriends.count
/*:
 The count is 4, meaning that the index in this array only have 0 to 3. Therefore, index 5 is not exist.
 
 If you execute myFriend[5] without checking if the index 5 contains a value, Swift will show error.
 */
//: ## 3-7.
myFriends.first
//: ## 3-8.
myFriends.last
//: ## 3-9.
var myCountryNumber: [String: Int] = [:]
//: ## 3-10.
myCountryNumber["US"] = 1
myCountryNumber["GB"] = 44
myCountryNumber["JP"] = 81
//print(myCountryNumber)
//: ## 3-11.
myCountryNumber.updateValue(0, forKey: "GB")
//print(myCountryNumber)
//: ## 3-12.
var emptyDictionary: [String: Int] = [:]
//: ## 3-13.
//remove a key value in two ways below:
//Take dictionary myCountryNumber for example
myCountryNumber.removeValue(forKey: "US")
//or
myCountryNumber["US"] = nil
//print(myCountryNumber)
//: # Part 4: Control Flow
//: ## 4-1.
let lottoNumbers = [10, 9, 8, 7, 6, 5]

for i in 3..<lottoNumbers.count {
    print(lottoNumbers[i])
}
print("---") //just a line for separation
//: ## 4-2.
for lottoNumber in lottoNumbers.reversed() {
    print(lottoNumber)
}
print("---") //just a line for separation

for evenIndex in lottoNumbers {
    if evenIndex % 2 == 0 {
        print(evenIndex)
    }
}
print("---") //just a line for separation
//: ## 4-3.
var index = lottoNumbers.count - 1
while index >= 0 {
    print(lottoNumbers[index])
    index -= 1
}
print("---") //just a line for separation

var evenIndex = 0
while evenIndex < lottoNumbers.count {
    print(lottoNumbers[evenIndex])
    evenIndex += 2
}
print("---") //just a line for separation
//: ## 4-4.
index = lottoNumbers.count - 1
repeat {
    print(lottoNumbers[index])
    index -= 1
} while index >= 0
print("---") //just a line for separation

evenIndex = 0
repeat {
    print(lottoNumbers[evenIndex])
    evenIndex += 2
} while evenIndex < lottoNumbers.count

print("---") //just a line for separation
//: ## 4-5.
/*:
 The main difference is the timing of checking the condition.
 
 While loop check the condition before loop code, and repeat while check the condition after. So you can still get the original setting value by repeat while.
 */
//: ## 4-6.
var isRaining: Bool = true
if isRaining {
    print("It’s raining, I don’t want to work today")
} else {
    print("Although it’s sunny, I still don’t want to work today.")
}
//: ## 4-7.
//if-else statement
let jobLevel = 2

if let jobTitle = [
    1: "Member",
    2: "Team Leader",
    3: "Manager",
    4: "Director"
][jobLevel] {
    print("\(jobTitle)")
} else {
    print("We don't have this job.")
}

//switch statement
switch jobLevel {
case 1:
    print("Member")
case 2:
    print("Team Leader")
case 3:
    print("Manager")
case 4:
    print("Director")
default:
    print("We don't have this job.")
}
//: # Part 5: Function
//: ## 5-1.
/*
 func birthday( ) -> String {
    
}
 */
//: Return type: String
 /*
  func payment( ) -> Double {
    
}
 */
//: Return type: Double
//: ## 5-2.
func multiply(a: Int, b: Int = 10) {
    let result = a * b
    print(result)
}

//multiply(a: 2)
//: ## 5-3.
/*:
 The difference is how these names are used when calling the function:
 
 - Parameter name: a function declares its parameter in its parameter list. Parameters used within the body of the function to define the behavior inside the function.

 - Argument lable: when you call a function, you provide value as arguments for the function's parameter.
 */
//Example:
// --------------------------------------
let passingGrade = 50
let samGrade = 99

func printPassStatus(for grade: Int, lowestPass: Int = passingGrade) {
  print(grade >= lowestPass ? "You passed!" : "Keep studying.")
}

printPassStatus(for: samGrade, lowestPass: 80)

//parameter name: grade, lowestPass(with a default value)
//argument label: for
//argument for parameter: samGrade, 80
//: ## 5-4.
func greet(person name: String) {
    print("Hello, \(name)")
}

greet(person: "Luke")
