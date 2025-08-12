@echo off
echo Starting ElitePDF servers...

start "Backend Server" /D backend npm run dev
start "Frontend Server" /D frontend npm start

echo Servers started. Access frontend at http://localhost:3000
