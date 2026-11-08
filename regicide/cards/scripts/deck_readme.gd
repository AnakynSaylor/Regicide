class_name Deck
extends Node2D
##
## This is the Deck node. This node will be the deck that the main game will
## grab from to fill the players hand. This will be initialized by filling
## an array with each card in sorted deck order, then scrambling the deck by
## looping through each index and generating a random number mod 52 then
## swap the card at the current index with the card at the random index. I will
## then use the array as a stack during the actual game. 
##
## These functions are to be used by the 

const DECKSIZE = 52;
@onready var cards = $Cards; ##this is the node that holds all of the cards
@onready var rand = RandomNumberGenerator.new();

## creates a fresh deck in sorted order
func init_deck():
	var deck: Array[AnimatedSprite2D] = [];
	deck.resize(DECKSIZE);
	for i in cards.get_children(): ## this will loop through the nodes in Cards
		for j in i.get_children(): ## this will get the children of each of those nodes
			print(i.name + " " + j.name); 
			deck.append(j);
	deck = scramble(deck);
	print("\n");
	return deck;

## takes in a deck of cards and moves each card at each index to a random index
## @parameter deck - an Array[AnimatedSprite2D]
func scramble(deck):
	rand.randomize(); ## i believe this resets the seed value
	for i in range(deck.size()):
		var temp = deck[i]; ##save the old value of the card at that index
		var num = rand.randi() % deck.size(); ## generate a random number from 0 to deck.size()
		deck[i] = deck[num]; ## move the card at the random index to the current index
		deck[num] = temp; ## move the card at the current index to the random index
	return deck;
	
## given a deck and a card (AnimatedSprite2D) it adds that to the end of the deck array
## @parameter deck - - an Array[AnimatedSprite2D]
## @parameter i - an AnimatedSprite2D
func push(deck, i):
	if(deck.size() == DECKSIZE - 1): ##if the stack is full return -1
		return -1;
	deck.push_back(i);

## given a deck it will remove the item at the end of the deck and return the
## removed item
## @parameter deck - an Array[AnimatedSprite2D]
func pop(deck):
	if(deck.is_empty()): ## if the stack is empty return -1
		return -1;
	var card = deck.pop_back();
	return card;

## given a deck it will return the value at the top of the deck
## @parameter deck - an Array[AnimatedSprite2D]
func peek(deck):
	if(deck.is_empty()):
		return -1;
	return deck.back();

func print_deck(deck):
	for i in deck:
		if(i != null):
			var child_name = i.name;
			var parent_name = i.get_parent().name;
			print(parent_name + " " + child_name);
			
