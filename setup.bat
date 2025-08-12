@echo off
echo Setting up ElitePDF...
echo.

echo Installing backend dependencies...
cd backend
npm install
cd ..

echo Installing frontend dependencies...
cd frontend
npm install
cd ..

echo.
echo Setup complete! Run ElitePDF\start.bat to launch the application.
