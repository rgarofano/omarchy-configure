echo "Installing ruby"
mise use -g ruby@latest
echo "Done"

echo "Installing rails and ruby-lsp"
mise exec -- gem install rails ruby-lsp
echo "Done"
