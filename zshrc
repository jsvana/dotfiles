export DOTFILES="$HOME/.dotfiles"
export PATH="/usr/local/bin:$DOTFILES/bin:$HOME/go/bin:/usr/local/share/npm/bin:$HOME/.rbenv/bin:$PATH"

case `uname -s` in
	"Darwin")
		export PROJECTS="$HOME/Projects"
		;;
	"Linux")
		export PROJECTS="$HOME/projects"
		;;
esac

find $DOTFILES/zshrc.d -name '*\.zsh' | sort | while read f; do
	source $f
done
