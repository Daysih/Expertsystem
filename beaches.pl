elem_in_list(X, [X|_]).
elem_in_list(X, [_|Tail]):- elem_in_list(X, Tail).
 
elems_in_list(X, [Y|_]):- elem_in_list(Y,X).
elems_in_list(X, [_|Tail]):- elems_in_list(X, Tail).

 
list_beach(Distance, Aspects, Sand, Beaches):- 
	list_beach(Distance, Aspects, Sand, [], Beaches). 
 
list_beach(Distance, Aspects, Sand, Acc, Beaches):- 
	beach(Name, Walking_distance, Aspects_of_beach, Type_Sand),
	elems_in_list(Aspects, Aspects_of_beach),
    elems_in_list(Sand, Type_Sand),
	elem_in_list(Distance, Walking_distance),
	\+ elem_in_list(Name, Acc), !, 
    list_beach(Distance, Aspects, Sand,[Name|Acc], Beaches).
 
 
 
list_beach(_,  _, _, Beaches,Beaches).


suggest_beach(B):-
	write('type the distance you would like to walk: 
            \n short_walk, long_walk, stairs, steep_stairs, short_hike\n'), 
	read(Distance), 
	write('choose a type of sand \n fine_sand, medium_sand, corse_sand, rocky \n'), 
	read(Sand),
	get_sand(Sand, Beach), 
	write('please choose an aspect of the beach \n cave, river, climbable_rocks, secluded, driftwood \n
            marshy, long, sharp_point, cliffs, flat_ground, agates, small_rocks, large_rocks \n
            mix_size_rocks, camel_rock, rocky_beach, sandy_beach,pier \n'),
	read(Aspects),
	list_beach(Distance, Aspects, Beach, B).

 

%get_sand, for the different sand types
get_sand(Sand, X):- 
    Sand = fine_sand, X = [moonstone, dry_Lagoon, college_Cove,
            houda_Point, luffenholtz, old_Home_Beach,
            trinidad_Head_Beach, trinidad_State_Beach].
 
get_sand(Sand, X):- 
    Sand = medium_sand, X = [baker_Beach, big_Lagoon, stone_lagoon].

get_sand(Sand, X):- 
    Sand = corse_sand, X = [agate_beach, martin_Creek].
get_sand(Sand, X):- 
    Sand = rocky, X = [palmers_Point].
 

%get walks, for the walking distance from parking
get_walk(Walk, X):- 
    Walk = short_walk, X = [moonstone, dry_lagoon, big_Lagoon, houda_Point, stone_lagoon, 
                            trinidad_Head_Beach, trinidad_State_Beach].
get_walk(Walk, X):- 
    Walk = long_walk, X = [agate_beach, college_Cove, old_Home_Beach, palmers_Point].

get_walk(Walk, X):- 
    Walk = steep_stairs, X = [baker_Beach, college_Cove, houda_Point, luffenholtz, old_Home_Beach, 
                              palmers_Point].

get_walk(Walk, X):- 
    Walk = short_hike, X = [martin_Creek].


%get_aspects, for the different aspects of each beach. 
get_aspect(Aspect, X):-
    Aspect = cave, X = [moonstone].

get_aspect(Aspect, X):-
    Aspect = river, X = [moonstone].

get_aspect(Aspect, X):-
    Aspect = secluded, X = [baker_Beach].

get_aspect(Aspect, X):-
    Aspect = clothing_optional, X = [baker_Beach].

get_aspect(Aspect, X):-
    Aspect = driftwood, X = [baker_Beach, dry_Lagoon, stone_lagoon].

get_aspect(Aspect, X):-
    Aspect = marshy, X = [dry_Lagoon, stone_lagoon].

get_aspect(Aspect, X):-
    Aspect = long, X = [dry_Lagoon].

get_aspect(Aspect, X):-
    Aspect = lagoon, X = [dry_Lagoon,big_Lagoon, stone_lagoon].

get_aspect(Aspect, X):-
    Aspect = cliffs, X = [big_Lagoon, agate_beach, stone_lagoon].

get_aspect(Aspect, X):-
    Aspect = flat_ground, X = [big_Lagoon].

get_aspect(Aspect, X):-
    Aspect = agates, X = [agate_beach].

get_aspect(Aspect, X):-
    Aspect = small_rocks, X = [agate_beach, old_Home_Beach].

get_aspect(Aspect, X):-
    Aspect = large_rocks, X = [college_Cove].

get_aspect(Aspect, X):-
    Aspect = mix_size_rocks, X = [agate_beach, old_Home_Beach].

get_aspect(Aspect, X):-
    Aspect = climbable_rocks, X = [moonstone, college_Cove, luffenholtz, trinidad_Head_Beach].

beach(moonstone, [short_walk], [cave, river, climbable_rocks], fine_sand).
beach(baker_Beach, [steep_stairs], [secluded, clothing_optional,
    mix_size_rocks, driftwood], medium_sand).
beach(dry_Lagoon, [short_walk], [driftwood, marshy, long, lagoon, sharp_point],
    fine_sand).
beach(big_Lagoon, [short_walk], [lagoon, cliffs, flat_ground],
    medium_sand).
beach(agate_beach, [long_walk, stairs], [cliffs, agates, small_rocks],
    corse_sand).
beach(college_Cove, [long_walk, steep_stairs], [large_rocks,
    climbable_rocks], fine_sand).
beach(houda_Point, [short_walk, steep_stairs], [mix_size_rocks, camel_rock],
    fine_sand).
beach(luffenholtz, [steep_stairs], [mix_size_rocks, climbable_rocks], 
    fine_sand).
beach(martin_Creek, [short_hike], [mix_size_rocks, rocky_beach], 
    corse_sand).
beach(old_Home_Beach, [long_walk, steep_stairs], [small_rocks],
    fine_sand).
beach(palmers_Point, [long_walk, steep_stairs], [rocky_beach, mix_size_rocks],
    rocky).

%this beach is in orick
beach(stone_lagoon, [short_walk], [marshy, driftwood, cliffs, lagoon],
    medium_sand).
beach(trinidad_Head_Beach, [short_walk], [small_beach, pier,
    mix_size_rocks, climbable_rocks], [fine_sand]).
beach(trinidad_State_Beach, [short_walk], [large_beach, sandy_beach,
    main_trinidad_beach], [fine_sand]).
