
%%%%% ATOMIC: clockwise
% Add the atomic propositions for clockwise (part a) in this section
clockwise(east, north).
clockwise(north, west).
clockwise(west, south).
clockwise(south, east).


%%%%% ATOMIC: counterclockwise
% Add the atomic propositions for counterclockwise (part a) in this section
counterclockwise(north, east).
counterclockwise(east, south).
counterclockwise(south, west).
counterclockwise(west, north).


%%%%% ATOMIC: reverseDirection
% Add the atomic propositions for reverseDirection (part a) in this section
reverseDirection(east, west).
reverseDirection(west, east).
reverseDirection(north, south).
reverseDirection(south, north).


%%%%% ATOMIC: facing
% Add the atomic propositions for facing (part b) in this section
facing(toyota, south).
facing(nissan, north).
facing(chevrolet, east).


%%%%% ATOMIC: lightColour
% Add the atomic propositions for lightColour (part b) in this section
lightColour(north, green).
lightColour(south, green).
lightColour(east, red).
lightColour(west, red).




%%%%% RULE: canGo


%%%first rule

canGo(Car, Direction) :-
facing(Car, Direction),
lightColour(Direction, green).


canGo(Car, Direction) :-
counterclockwise(OurDir, Direction),
lightColour(OurDir, green),
canGo(Car, OurDir).

%%%first rule end

%%%second rule
canGo(Car, Direction) :-
clockwise(OurDir, Direction),
lightColour(OurDir, green),
reverseDirection(revDir, OurDir),
not facing(Entity, revDir),
canGo(Car, OurDir).

%%%third rule - right yellow
canGo(Car, Direction) :-
counterclockwise(OurDir, Direction),
lightColour(OurDir, yellow).

%%%fourth rule left yellow
canGo(Car, Direction) :-
clockwise(OurDir, Direction),
lightColour(OurDir, yellow).

%%%fifth rule right on red

canGo(Car, Direction) :-
counterclockwise(OurDir, Direction),
lightColour(OurDir, red),
not facing(Car2, Direction).




%%%%% END
