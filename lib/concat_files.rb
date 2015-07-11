def concat_files(files)
  files.collect do |f|
    item = @items.find {|i| i.identifier =~ /#{f}\/$/}
    item ? item.compiled_content : puts("WARNING: couldn't find file #{f}")
  end.compact.join("\n")
end
