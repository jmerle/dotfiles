autoload -Uz compinit

# Speed up compinit by only checking the cached .zcompdump once a day
for dump in ~/.zcompdump(N.mh+24); do
    compinit
done

compinit -C
