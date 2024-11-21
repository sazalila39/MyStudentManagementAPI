def show_cart(cart):
    """Display the current contents of the shopping cart."""
    print("\nYour shopping cart contains:")
    if cart:
        for item in cart:
            print(f"- {item}")
    else:
        print("Your cart is empty.")

def main():
    shopping_cart = []  # List to store shopping cart items

    while True:
        print("\nWelcome to your shopping cart!")
        print("Choose an option:")
        q = input("1. Meat\n2. Vegetables\n3. Fruit\n4. Exit\n")

        if q == "1":
            meat = input("Please pick your meat:\n A.Beef\n B.Chicken\n C.Fish\n")
            if meat.lower() == "a":
                shopping_cart.append("Beef")
                print("Added Beef to your cart.")
            elif meat.lower() == "b":
                shopping_cart.append("Chicken")
                print("Added Chicken to your cart.")
            elif meat.lower() == "c":
                shopping_cart.append("Fish")
                print("Added Fish to your cart.")
            else:
                print("Invalid choice. Please select a valid option.")
            show_cart(shopping_cart)  # Show the updated cart

        elif q == "2":
            veg = input("Please pick your vegetables:\n A.Carrots\n B.Lettuce\n C.Pumpkin\n")
            if veg.lower() == "a":
                shopping_cart.append("Carrots")
                print("Added Carrots to your cart.")
            elif veg.lower() == "b":
                shopping_cart.append("Lettuce")
                print("Added Lettuce to your cart.")
            elif veg.lower() == "c":
                shopping_cart.append("Pumpkin")
                print("Added Pumpkin to your cart.")
            else:
                print("Invalid choice. Please select a valid option.")
            show_cart(shopping_cart)  # Show the updated cart

        elif q == "3":
            fruit = input("Please pick your fruit:\n A.Grapes\n B.Apples\n C.Oranges\n")
            if fruit.lower() == "a":
                shopping_cart.append("Grapes")
                print("Added Grapes to your cart.")
            elif fruit.lower() == "b":
                shopping_cart.append("Apples")
                print("Added Apples to your cart.")
            elif fruit.lower() == "c":
                shopping_cart.append("Oranges")
                print("Added Oranges to your cart.")
            else:
                print("Invalid choice. Please select a valid option.")
            show_cart(shopping_cart)  # Show the updated cart

        elif q == "4":
            print("\nThank you for shopping with us!")
            show_cart(shopping_cart)  # Final cart display before exiting
            break

        else:
            print("Invalid option. Please select a valid menu option.")

if __name__ == "__main__":
    main()
