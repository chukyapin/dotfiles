# function __fzf_tldr --description "Search tldr using fzf"
#     fd --print0 --extension md . ~/.cache/tealdeer/tldr-pages/pages/{linux,common} \
#         | sed -z 's/.*\///; s/\.md$//' \
#         | fzf --read0 --query=(commandline) --preview 'fish -c "tldr {}"' --preview-window right:75% \
#         | read -lz cmd
#
#     if test $status -eq 0
#         # trim any surrounding white space
#         commandline --replace (echo $cmd | sed -zr "s/^\s+|\s+\$//g")
#     end
#
#     commandline --function repaint
# end

# function __fzf_tldr --description "Search tldr using fzf"
# fd --print0 --extension md . ~/Library/Caches/tealdeer/tldr-pages/pages/{linux,common} \
#     | gsed -z 's/.*\///; s/\.md$//' 
#     | fzf --read0 --query=(commandline) --preview 'fish -c "tldr {}"' --preview-window right:75% \
#     | read -lz cmd
#
# if test $status -eq 0
#     commandline --replace (echo $cmd | gsed -zr "s/^\s+|\s+\$//g")
# end
#
#     commandline --function repaint
# end


function __fzf_tldr --description "Search tldr using fzf"
    # tealdeer の Pages directory（さっき `tldr --show-paths` で出たやつ）
    set -l pages_dir /Users/metal/Library/Caches/tealdeer/tldr-pages/pages.en

    fd --print0 --extension md . $pages_dir/{linux,common} \
        | gsed -z 's/.*\///; s/\.md$//' \
        | fzf --read0 --query=(commandline) --preview 'fish -c "tldr {}"' --preview-window right:75% \
        | read -lz cmd

    if test $status -eq 0
        # 前後の空白を削る
        commandline --replace (echo $cmd | gsed -zr "s/^\s+|\s+\$//g")
    end

    commandline --function repaint
end
