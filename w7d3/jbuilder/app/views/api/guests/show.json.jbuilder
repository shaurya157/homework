# json.extract! @guest, :name, :age, :favorite_color
#
# json.gifts @guest.gifts

json.partial! 'api/guests/guest'
json.gifts @guest.gifts
