function userData = getUserData()
   name = input('Input your name: ', 's');
   age = uint16(input('Input your age: '));
   town = input('Input your home town: ', 's');
   favTeam = input('Input your favourite team: ', 's');
   
   userData = {name, age, town, favTeam};  
end