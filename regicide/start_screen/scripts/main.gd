extends Node2D

@onready var deck = $Deck;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_deck = deck.init_deck();
	deck.print_deck(new_deck);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
