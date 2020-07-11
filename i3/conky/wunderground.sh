apikey='4edc3a0bdf25b7ef'

weather=$(curl -s http://api.wunderground.com/api/${apikey}/conditions/q/CN/Hefei.json)
city=$(echo $weather | jq -r '.current_observation.observation_location.city')
condition=$(echo $weather | jq -r '.current_observation.weather')
temperature=$(printf '%.0f' $(echo $weather | jq '.current_observation.temp_c'))
uv=$(echo $weather | jq -r '.current_observation.UV')

forecast=$(curl -s http://api.wunderground.com/api/${apikey}/forecast/q/CN/Hefei.json)
temp_h=$(echo $forecast | jq -r '.forecast.simpleforecast.forecastday[0].high.celsius')
temp_l=$(echo $forecast | jq -r '.forecast.simpleforecast.forecastday[0].low.celsius')

echo -n "$condition: "
echo $temperature°C \($uv\) \[$temp_h-$temp_l\]
