//: ## 4.
func printPyramid(layers: Int) { 
    for i in 1...layers {
        for _ in 0..<(layers - i) {
            print(" ", terminator: "")
        }
        for _ in 1...(2 * i - 1) {
            print("*", terminator: "")
        }
        print()
    }
}

printPyramid(layers: 5)

//: ## 5.
/*:
 Some ideas:
 
 1. To-Go list app:
    - Store places you would like to visit, and can be sorted by attractions, restaurant, desserts & drink, activities, etc.
    - The app can also link the places to google map or iOS map.
 
 2. Calorie control app: 
    - Record the food you eat and calculate calorie, custimized users' diet plan by users' TDEE.
    - Include generative AI which can give diet suggestion.
 
 3. Clothes fit app:
    - Fetch the information of the clothes online, and simulate how users look with that clothes by showing an image.
 
 */
