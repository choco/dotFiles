ENV['HOMEBREW_CASK_OPTS'] = "--appdir=/Applications"

def brew_install(package, *options)
  `brew list #{package}`
  return if $?.success?

  sh "brew install #{package} #{options.join ' '}"
end

def install_github_bundle(user, package)
  unless File.exist? File.expand_path("~/.vim/bundle/#{package}")
    sh "git clone https://github.com/#{user}/#{package} ~/.vim/bundle/#{package}"
  end
end

def brew_cask_install(package, *options)
  output = `brew cask info #{package}`
  return unless output.include?('Not installed')

  sh "brew cask install #{package} #{options.join ' '}"
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
    unless system('which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"')
      raise "Homebrew must be installed before continuing."
    end
  end

  desc 'Install Homebrew Cask'
  task :brew_cask do
    step 'Homebrew Cask'
    unless system('brew tap | grep phinze/cask > /dev/null') || system('brew tap phinze/homebrew-cask')
      abort "Failed to tap phinze/homebrew-cask in Homebrew."
    end

    brew_install 'brew-cask'
  end

  desc 'Install The Silver Searcher'
  task :the_silver_searcher do
    step 'the_silver_searcher'
    brew_install 'the_silver_searcher'
  end

  desc 'Install iTerm'
  task :iterm do
    step 'iterm2'
    unless app? 'iTerm'
      brew_cask_install 'iterm2'
    end
  end

  desc 'Install ctags'
  task :ctags do
    step 'ctags'
    brew_install 'ctags'
  end

  desc 'Install reattach-to-user-namespace'
  task :reattach_to_user_namespace do
    step 'reattach-to-user-namespace'
    brew_install 'reattach-to-user-namespace'
  end

  desc 'Install git'
  task :git do
    step 'git'
    brew_install 'git'
  end

  desc 'Install zsh'
  task :zsh do
    step 'zsh'
    brew_install 'zsh'
  end

  desc 'Install tmux'
  task :tmux do
    step 'tmux'
    brew_install 'tmux'
  end

  desc 'Install cmake'
  task :cmake do
    step 'cmake'
    brew_install 'cmake'
  end

  desc 'Install glassfish'
  task :glassfish do
    step 'glassfish'
    brew_install 'glassfish'
  end

  desc 'Install MacVim'
  task :macvim do
    step 'MacVim'
    brew_install 'macvim', ['--override-system-vim']
  end

  desc 'Install Maven'
  task :maven do
    step 'Maven'
    brew_install 'maven'
  end

  desc 'Install MySQL'
  task :mysql do
    step 'MySQL'
    brew_install 'mysql'
  end

  desc 'Install IntelliJ IDEA'
  task :intellij do
    step 'IntelliJ IDEA'
    brew_cask_install 'intellij-idea-ultimate'
  end

  desc 'Install VLC'
  task :vlc do
    step 'VLC'
    brew_cask_install 'vlc'
  end

  desc 'Install Transmission'
  task :transmission do
    step 'Transmission'
    brew_cask_install 'transmission'
  end

  desc 'Install The Unarchiver'
  task :unarchiver do
    step 'The Unarchiver'
    brew_cask_install 'the-unarchiver'
  end

  desc 'Install TeamSpeak Client'
  task :teamspeak do
    step 'TeamSpeak'
    brew_cask_install 'teamspeak-client'
  end

  desc 'Install Skype'
  task :skype do
    step 'Skype'
    brew_cask_install 'skype'
  end

  desc 'Install Sequel Pro'
  task :sequel do
    step 'Sequel Pro'
    brew_cask_install 'sequel-pro'
  end

  desc 'Install Plex Media Server'
  task :plex do
    step 'Plex Media Server'
    brew_cask_install 'plex-media-server'
  end

  desc 'Install OpenEmu'
  task :openemu do
    step 'OpenEmu'
    brew_cask_install 'openemu'
  end

  desc 'Install Little Snitch'
  task :littlesnitch do
    step 'Little Snitch'
    brew_cask_install 'little-snitch'
  end

  desc 'Install Hopper Disassembler'
  task :hopper do
    step 'Hopper Disassembler'
    brew_cask_install 'hopper-disassembler'
  end

  desc 'Install Google Chrome'
  task :chrome do
    step 'Google Chrome'
    brew_cask_install 'google-chrome'
  end

  desc 'Install Github for Mac'
  task :github do
    step 'Github for Mac'
    brew_cask_install 'github'
  end

  desc 'Install HandBrake'
  task :handbrake do
    step 'HandBrake'
    brew_cask_install 'handbrake'
  end

  desc 'Install Dropbox'
  task :dropbox do
    step 'Dropbox'
    brew_cask_install 'dropbox'
  end

  desc 'Install Silverlight'
  task :silverlight do
    step 'Silverlight'
    brew_cask_install 'silverlight'
  end

  desc 'Install Quicklook-JSON'
  task :qljson do
    step 'Quicklook-JSON'
    brew_cask_install 'quicklook-json'
  end

  desc 'Install QLPrettyPatch'
  task :qlprettypatch do
    step 'QLPrettyPatch'
    brew_cask_install 'qlprettypatch'
  end

  desc 'Install QLColorCode'
  task :qlcolorcode do
    step 'QLColorCode'
    brew_cask_install 'qlcolorcode'
  end

  desc 'Install QLMarkdown'
  task :qlmarkdown do
    step 'QLMarkdown'
    brew_cask_install 'qlmarkdown'
  end

  desc 'Install Java'
  task :java do
    step 'Java'
    brew_cask_install 'java'
  end

  desc 'Install Flash'
  task :flash do
    step 'Flash'
    brew_cask_install 'flash'
  end

  desc 'Install Skim'
  task :skim do
    step 'Skim'
    brew_cask_install 'skim'
  end

  desc 'Install Vundle'
  task :vundle do
    step 'vundle'
    install_github_bundle 'gmarik','vundle'
    sh '~/bin/vim -c "BundleInstall" -c "q" -c "q"'
    sh 'cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer'
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
  'vimrc.bundles.local' => '~/.vimrc.bundles.local'
)

LINKED_FILES = filemap(
  'vim'           => '~/.vim',
  'tmux.conf'     => '~/.tmux.conf',
  'vimrc'         => '~/.vimrc',
  'vimrc.bundles' => '~/.vimrc.bundles'
)

desc 'Install these config files.'
task :install do
  Rake::Task['install:brew'].invoke
  Rake::Task['install:brew_cask'].invoke
  Rake::Task['install:the_silver_searcher'].invoke
  Rake::Task['install:iterm'].invoke
  Rake::Task['install:ctags'].invoke
  Rake::Task['install:reattach_to_user_namespace'].invoke
  Rake::Task['install:tmux'].invoke
  Rake::Task['install:macvim'].invoke
  Rake::Task['install:java'].invoke
  Rake::Task['install:flash'].invoke
  Rake::Task['install:skim'].invoke
  Rake::Task['install:qlmarkdown'].invoke
  Rake::Task['install:qlcolorcode'].invoke
  Rake::Task['install:qlprettypatch'].invoke
  Rake::Task['install:qljson'].invoke
  Rake::Task['install:dropbox'].invoke
  Rake::Task['install:handbrake'].invoke
  Rake::Task['install:git'].invoke
  Rake::Task['install:github'].invoke
  Rake::Task['install:silverlight'].invoke
  Rake::Task['install:zsh'].invoke
  Rake::Task['install:cmake'].invoke
  Rake::Task['install:glassfish'].invoke
  Rake::Task['install:maven'].invoke
  Rake::Task['install:mysql'].invoke
  Rake::Task['install:intellij'].invoke
  Rake::Task['install:vlc'].invoke
  Rake::Task['install:hopper'].invoke
  Rake::Task['install:openemu'].invoke
  Rake::Task['install:littlesnitch'].invoke
  Rake::Task['install:sequel'].invoke
  Rake::Task['install:plex'].invoke
  Rake::Task['install:skype'].invoke
  Rake::Task['install:teamspeak'].invoke
  Rake::Task['install:unarchiver'].invoke
  Rake::Task['install:transmission'].invoke
  Rake::Task['install:chrome'].invoke


  # TODO install gem ctags?
  # TODO run gem ctags?

  step 'symlink'

  LINKED_FILES.each do |orig, link|
    link_file orig, link
  end

  COPIED_FILES.each do |orig, copy|
    cp orig, copy, :verbose => true unless File.exist?(copy)
  end

  # Install Vundle and bundles
  Rake::Task['install:vundle'].invoke

  step 'iterm2 colorschemes'
  colorschemes = `defaults read com.googlecode.iterm2 'Custom Color Presets'`
  dark  = colorschemes !~ /Solarized Dark/
  light = colorschemes !~ /Solarized Light/
  sh('open', '-a', '/Applications/iTerm.app', File.expand_path('iterm2-colors/base16-ocean.dark.itermcolors')) if dark
  sh('open', '-a', '/Applications/iTerm.app', File.expand_path('iterm2-colors/base16-ocean.light.itermcolors')) if light

  step 'iterm2 profiles'
  puts
  puts "  Your turn!"
  puts
  puts "  Go and manually set up Solarized Light and Dark profiles in iTerm2."
  puts "  (You can do this in 'Preferences' -> 'Profiles' by adding a new profile,"
  puts "  then clicking the 'Colors' tab, 'Load Presets...' and choosing a Solarized option.)"
  puts "  Also be sure to set Terminal Type to 'xterm-256color' in the 'Terminal' tab."
  puts
  puts "  Enjoy!"
  puts
end

desc 'Uninstall these config files.'
task :uninstall do
  step 'un-symlink'

  # un-symlink files that still point to the installed locations
  LINKED_FILES.each do |orig, link|
    unlink_file orig, link
  end

  # delete unchanged copied files
  COPIED_FILES.each do |orig, copy|
    rm_f copy, :verbose => true if File.read(orig) == File.read(copy)
  end

  step 'homebrew'
  puts
  puts 'Manually uninstall homebrew if you wish: https://gist.github.com/mxcl/1173223.'

  step 'iterm2'
  puts
  puts 'Run this to uninstall iTerm:'
  puts
  puts '  rm -rf /Applications/iTerm.app'

end

task :default => :install
