# docker-compose用起動スクリプト

if [ -z $SHINKAN_IS_DEV ]; then
  echo '💁 Launching in production mode.' >&2
  npm start
else
  echo '⚒️ Launching in DEVELOPMENT mode.' >&2
  npm run dev
fi
