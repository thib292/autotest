import pytest
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from src.main import greet

def test_greet():
    assert greet("Alice") == "Hello, Alice!"
    assert greet("Bob") == "Hello, Bob!"
    assert greet("World") == "Hello, World!"
    assert greet("") == "Hello, !"
    assert greet(None) == "Hello, None!"

if __name__ == "__main__":
    pytest.main()
