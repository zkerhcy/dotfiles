# User configurables below:
# Uncomment this line for fahrenheit:
#metric='imperial' && unit='F'
# Otherwise comment above line, uncomment here for celcius:
metric='metric'
unit='C'

# First, geolocate our IP:
ipinfo=$(curl -s ipinfo.io)
latlong=$(echo $ipinfo | jq -r '.loc')
# Parse the latitude and longitude into their own values
appid=c06d2830c64246b3a6aaca05fb1537a2
lat=31.82
lon=117.20

weather=$(curl -s http://api.openweathermap.org/data/2.5/weather\?lat\=${lat}\&lon\=${lon}\&appid\=${appid}\&units\=${metric})
#echo $weather
temperature=$(printf '%.0f' $(echo $weather | jq '.main.temp'))
condition=$(echo $weather | jq -r '.weather[0].main')

#echo -n "$city - $condition: "
echo -n "$condition: "
echo $temperature °$unit
