# Print my public ip
alias myip='curl ipinfo.io/ip | xclip -selection clipboard'

# Show weather
alias weather='curl https://wttr.in/'

# Echo Shrug Emoticon
alias shrug='echo "¯\_(ツ)_/¯" | xclip -selection clipboard'

# Generate new GUID
alias newguid='python3 -c "import uuid; print(str(uuid.uuid4()))" | xclip -selection clipboard'

# bat cat
alias cat='batcat'
