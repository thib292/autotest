import pytest
from main import greet

def test_greet():
    assert greet("Alice") == "Hello, Alice!"
    assert greet("Bob") == "Hello, Bob!"
    assert greet("World") == "Hello, World!"
    assert greet("") == "Hello, !"
    assert greet(None) == "Hello, None!"

if __name__ == "__main__":
    pytest.main()
