a=1
for i in document_*; do
  new=$(printf "document_%03d.json" "$a")
  mv -- "$i" "$new"
  let a=a+1
done
