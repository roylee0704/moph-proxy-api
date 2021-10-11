start:
	node index

start-pm2:
	pm2 start ecosystem.config.js

stop-pm2:
	pm2 stop ecosystem.config.js
