#!/usr/bin/env python3
import sys

def main():
    if len(sys.argv) > 1:
        print(" ".join(sys.argv[1:]))
    else:
        print("demo_echo: no arguments provided")

if __name__ == "__main__":
    main()
