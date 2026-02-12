# Check if Python is installed
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "Error: Python is not installed or not in your PATH." -ForegroundColor Red
    Pause
    exit
}

# Create virtual environment if it doesn't exist
if (-not (Test-Path "venv")) {
    Write-Host "Creating virtual environment..." -ForegroundColor Cyan
    python -m venv venv
}

# Activate virtual environment
Write-Host "Activating virtual environment..." -ForegroundColor Cyan
if (Test-Path "venv\Scripts\Activate.ps1") {
    . .\venv\Scripts\Activate.ps1
} else {
    Write-Host "Error: Could not find activation script." -ForegroundColor Red
    Pause
    exit
}

# Install requirements
if (Test-Path "requirements.txt") {
    Write-Host "Installing requirements..." -ForegroundColor Cyan
    pip install -r requirements.txt
} else {
    Write-Host "Warning: requirements.txt not found." -ForegroundColor Yellow
}

# Run the application
Write-Host "Starting Future Wallet..." -ForegroundColor Green
python app.py

Pause
