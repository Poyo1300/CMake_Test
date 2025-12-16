// CMake_Exo.cpp : définit le point d'entrée de l'application.
//

#include "CMake_Exo.h"
#include "CMake_Lib.h"
#include "SFML/Graphics.hpp"


using namespace std;

int main()
{
	sf::RenderWindow window(sf::VideoMode::getDesktopMode(), "Test CMake");
	sf::RectangleShape rect;

	rect.setSize({ 200,100 });
	rect.setOrigin(rect.getSize() / 2.f);
	rect.setPosition(sf::Vector2f(window.getSize() / 2u));
	sf::Clock clock;
	while (window.isOpen())
	{
		float dt = clock.restart().asSeconds();
		window.handleEvents([&](const sf::Event::Closed& evt)
			{
				window.close();
			});

		rect.setRotation(rect.getRotation() + sf::degrees(360.f) * dt);
		rect.setFillColor(sf::Color(rand() % 256, rand() % 256, rand() % 256));

		window.clear();

		window.draw(rect);

		window.display();
	}


	print("Hello from exe");
	return 0;
}
