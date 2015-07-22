def brew_install(package, *args)
  versions = `brew list #{package} --versions`
  options = args.last.is_a?(Hash) ? args.pop : {}

  # if brew exits with error we install tmux
  if versions.empty?
    sh "brew install #{package} #{args.join ' '}"
  elsif options[:requires]
    # brew did not error out, verify tmux is greater than 1.8
    # e.g. brew_tmux_query = 'tmux 1.9a'
    installed_version = versions.split(/\n/).first.split(' ')[1]
    unless version_match?(options[:version], installed_version)
      sh "brew upgrade #{package} #{args.join ' '}"
    end
  end
end

def version_match?(requirement, version)
  # This is a hack, but it lets us avoid a gem dep for version checking.
  Gem::Dependency.new('', requirement).match?('', version)
end

def install_github_bundle(user, package)
  unless File.exist? File.expand_path("~/.vim/bundle/#{package}")
    sh "git clone https://github.com/#{user}/#{package} ~/.vim/bundle/#{package}"
  end
end

def step(description)
  description = "-- #{description} "
  description = description.ljust(80, '-')
  puts
  puts "\e[32m#{description}\e[0m"
end

def app_path(name)
  path = "/Applications/#{name}.app"
  ["~#{path}", path].each do |full_path|
    return full_path if File.directory?(full_path)
  end

  return nil
end

def app?(name)
  return !app_path(name).nil?
end

def get_backup_path(path)
  number = 1
  backup_path = "#{path}.bak"
  loop do
    if number > 1
      backup_path = "#{backup_path}#{number}"
    end
    if File.exists?(backup_path) || File.symlink?(backup_path)
      number += 1
      next
    end
    break
  end
  backup_path
end

def link_file(original_filename, symlink_filename)
  original_path = File.expand_path(original_filename)
  symlink_path = File.expand_path(symlink_filename)
  if File.exists?(symlink_path) || File.symlink?(symlink_path)
    if File.symlink?(symlink_path)
      symlink_points_to_path = File.readlink(symlink_path)
      return if symlink_points_to_path == original_path
      # Symlinks can't just be moved like regular files. Recreate old one, and
      # remove it.
      ln_s symlink_points_to_path, get_backup_path(symlink_path), :verbose => true
      rm symlink_path
    else
      # Never move user's files without creating backups first
      mv symlink_path, get_backup_path(symlink_path), :verbose => true
    end
  end
  ln_s original_path, symlink_path, :verbose => true
end

def unlink_file(original_filename, symlink_filename)
  original_path = File.expand_path(original_filename)
  symlink_path = File.expand_path(symlink_filename)
  if File.symlink?(symlink_path)
    symlink_points_to_path = File.readlink(symlink_path)
    if symlink_points_to_path == original_path
      # the symlink is installed, so we should uninstall it
      rm_f symlink_path, :verbose => true
      backups = Dir["#{symlink_path}*.bak"]
      case backups.size
      when 0
        # nothing to do
      when 1
        mv backups.first, symlink_path, :verbose => true
      else
        $stderr.puts "found #{backups.size} backups for #{symlink_path}, please restore the one you want."
      end
    else
      $stderr.puts "#{symlink_path} does not point to #{original_path}, skipping."
    end
  else
    $stderr.puts "#{symlink_path} is not a symlink, skipping."
  end
end

namespace :install do
  desc 'Update or Install Brew'
  task :brew do
    step 'Homebrew'
    unless system('which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
      raise "Homebrew must be installed before continuing."
    end
  end

  desc 'Install Git'
  task :git do
      step 'git'
      brew_install 'git'
  end

  desc 'Install cmake'
  task :cmake do
      step 'cmake'
      brew_install 'cmake'
  end

  desc 'Install ctags'
  task :ctags do
    step 'ctags'
    brew_install 'ctags'
  end

  desc 'Install cscope'
  task :cscope do
    step 'cscope'
    brew_install 'cscope'
  end

  desc 'Install The Silver Searcher'
  task :the_silver_searcher do
    step 'the_silver_searcher'
    brew_install 'the_silver_searcher'
  end

  desc 'Install tmux'
  task :tmux do
    step 'tmux'
    brew_install 'tmux', ['--HEAD']
  end

  desc 'Install Zsh'
  task :zsh do
      step 'zsh'
      brew_install 'zsh'
  end

  desc 'Install Python 2'
  task :python2 do
      step 'python2'
      brew_install 'python'
  end

  desc 'Install Python 3'
  task :python3 do
      step 'python3'
      brew_install 'python3'
  end

  desc 'Install Vim'
  task :vim do
      step 'vim'
      brew_install 'vim', ['--override-system-vi', '--with-lua', '--with-luajit', '--HEAD']
  end

  desc 'Install MacVim'
  task :macvim do
      step 'macvim'
      brew_install 'macvim', ['--with-lua', '--with-luajit', '--custom-icons']
  end

  desc 'Install Neovim'
  task :neovim do
      step 'neovim'
      sh "brew tap neovim/homebrew-neovim"
      brew_install 'neovim', ['--HEAD']
  end

  desc 'Install Archey'
  task :archey do
      step 'archey'
      brew_install 'archey'
  end

  desc 'Install mono'
  task :mono do
      step 'mono'
      brew_install 'mono'
  end

  desc 'Install OpenGL support libraries'
  task :opengl_support_libs do
      step 'opengl_support_libs'
      sh "brew tap homebrew/versions"
      brew_install 'glm'
      brew_install 'glfw3'
      brew_install 'glew'
      brew_install 'assimp'
  end

  desc 'Install Vim Plugins'
  task :vim_plugins do
    step 'vim_plugins'
    sh 'nvim +PluginInstall +qall'
  end
end

def filemap(map)
  map.inject({}) do |result, (key, value)|
    result[File.expand_path(key)] = File.expand_path(value)
    result
  end.freeze
end

COPIED_FILES = filemap(
  'vimrc.local'         => '~/.vimrc.local',
  'vimrc.bundles.local' => '~/.vimrc.bundles.local',
  'tmux.conf.local'     => '~/.tmux.conf.local'
)

VIM_FILES = filemap(
  'vim'           => '~/.vim',
  'vimrc'         => '~/.vimrc',
  'vimrc.plugins' => '~/.vimrc.plugins'
)

NVIM_FILES = filemap(
  'vim'           => '~/.nvim',
  'vimrc'         => '~/.nvimrc'
)

GIT_FILES = filemap(
  'git/gitconfig' => '~/.gitconfig',
  'git/gitignore_global' => '~/.gitignore_global'
)

ZSH_FILES = filemap(
  'zsh/zlogin'    => '~/.zlogin',
  'zsh/zlogout'   => '~/.zlogout',
  'zsh/zpreztorc' => '~/.zpreztorc',
  'zsh/zprofile'  => '~/.zprofile',
  'zsh/zshenv'    => '~/.zshenv',
  'zsh/zshrc'     => '~/.zshrc'
)

OTHER_FILES = filemap(
  'tmux.conf'     => '~/.tmux.conf',
  'slate.js'      => '~/.slate.js',
  'ssh'           => '~/.ssh',
  'color_profile.sh' => '~/.color_profile.sh',
  'livestreamerrc' => '~/.livestreamerrc',
  'weechat' => '~/.weechat'
)

desc 'Install these config files.'
task :install do
  Rake::Task['install:brew'].invoke
  Rake::Task['install:git'].invoke
  Rake::Task['install:cmake'].invoke
  Rake::Task['install:ctags'].invoke
  Rake::Task['install:cscope'].invoke
  Rake::Task['install:the_silver_searcher'].invoke
  Rake::Task['install:tmux'].invoke
  Rake::Task['install:zsh'].invoke
  Rake::Task['install:python2'].invoke
  Rake::Task['install:python3'].invoke
  Rake::Task['install:vim'].invoke
  Rake::Task['install:macvim'].invoke
  Rake::Task['install:neovim'].invoke
  Rake::Task['install:archey'].invoke
  Rake::Task['install:mono'].invoke
  Rake::Task['install:opengl_support_libs'].invoke

  step 'symlink'

  VIM_FILES.each do |orig, link|
    link_file orig, link
  end
  NVIM_FILES.each do |orig, link|
    link_file orig, link
  end
  GIT_FILES.each do |orig, link|
    link_file orig, link
  end
  ZSH_FILES.each do |orig, link|
    link_file orig, link
  end
  OTHER_FILES.each do |orig, link|
    link_file orig, link
  end

  # COPIED_FILES.each do |orig, copy|
  #   cp orig, copy, :verbose => true unless File.exist?(copy)
  # end

  Rake::Task['install:vim_plugins'].invoke
end

desc 'Uninstall these config files.'
task :uninstall do
  step 'un-symlink'

  # un-symlink files that still point to the installed locations
  VIM_FILES.each do |orig, link|
    unlink_file orig, link
  end
  NVIM_FILES.each do |orig, link|
    unlink_file orig, link
  end
  GIT_FILES.each do |orig, link|
    unlink_file orig, link
  end
  ZSH_FILES.each do |orig, link|
    unlink_file orig, link
  end
  OTHER_FILES.each do |orig, link|
    unlink_file orig, link
  end

  # # delete unchanged copied files
  # COPIED_FILES.each do |orig, copy|
  #   rm_f copy, :verbose => true if File.read(orig) == File.read(copy)
  # end
end

task :default => :install
