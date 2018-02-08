# README
app heroku https://j24-eventbrite-ad.herokuapp.com/


## les table sont liée de la manière suivante :

user -> creations -> events

even -> registrations -> users

* Le bouton "subscribe" pour un event apparait en fonction de si l'user y est inscit ou pas
* Parcontre je n'ai pas encore trouvé le code pour recuperer l'event dans la method "subscribe" donc cette partie n'est pas achévée

* si on arrive à recuperer l'event, on peut faire """
event = Event.find(params[:id])
event.users << @current_user
r = Registration.new
r.user_id = @current_user.id
r.event_id = event.id
redirect_to event_path(even)  """

## rentrez obligatoirement tout les champs lors de la création d'un event ( les exceptions n'ont pas été prises en compte pour l'instant )
