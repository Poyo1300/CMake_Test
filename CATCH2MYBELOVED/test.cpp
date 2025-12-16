#define CATCH_CONFIG_MAIN
#include <catch2/catch_test_macros.hpp>

// A simple function to test
unsigned int Factorial(unsigned int number) {
    return (number <= 1) ? 1 : number * Factorial(number - 1);
}

TEST_CASE("Factorials are computed", "[factorial]") {
    // REQUIRE checks if the expression is true.
    // If it fails, the test stops immediately.
    REQUIRE(Factorial(1) == 1);
    REQUIRE(Factorial(2) == 2);
    REQUIRE(Factorial(3) == 6);
    REQUIRE(Factorial(10) == 3628800);
}

TEST_CASE("Simple addition checks", "[math]") {
    int a = 5;
    int b = 5;

    SECTION("Positive addition") {
        REQUIRE(a + b == 10);
    }

    SECTION("Negative addition logic") {
        REQUIRE(a + b != 12);
    }
}


SCENARIO("Les vectors peuvent etre dimensionnes et resize ","[vector]")
{
	GIVEN("Un vector avec quelques elements")
	{
        std::vector<int> v(5);
        REQUIRE(v.size() == 5);

        WHEN("La taille est augmentee")
        {
            v.resize(10);
            THEN("La taille et la capacite changent")
            {
                REQUIRE(v.size() == 10);
                REQUIRE(v.capacity() >= 10);
            }
        }
        WHEN("Le vector est clear")
        {
            v.clear();
            THEN("La taille est zero mais la capacite est inchangee")
            {
                REQUIRE(v.size() == 0);
                REQUIRE(v.capacity() >= 5);
            }
        }
	}
}