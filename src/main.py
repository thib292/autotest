def greet(name) -> str:
    """Function to greet a person with their name."""
    return f"Hello, {name}!"

if __name__ == "__main__":
    user_name = input("Enter your username: ")
    print(greet(user_name))
