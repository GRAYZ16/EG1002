%Blackjack

hand = 0;
cards = 0;

hand = hand + randi(10);

while(hand < 21)
    hand = hand + randi(10);
    cards = cards + 1;
end

cards