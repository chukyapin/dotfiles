
function nvim_stable
    set -x NVIM_APPNAME nvim
    command nvim $argv
end

function nvim_nightly
    set -x NVIM_APPNAME nvim_nightly
    command nvim $argv
end
