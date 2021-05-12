import re
from collections import defaultdict
from pathlib import PurePath
from pprint import pprint

filename_pattern = re.compile("Filename: (.*)")
pattern = re.compile("([^ ]+) [^(]+ \(([^ ]+).*\)(.*)")

matches = []
linecount = 0;
current_filename = ""

with open("output.txt", "r", encoding="utf-8") as data_file:
    try:
        for line in data_file:
            linecount += 1

            filename_match = filename_pattern.match(line)
            if filename_match:
                current_filename = filename_match.group(0)
            else:
                match = pattern.match(line)
                if match:
                    (rev, author, line) = match.groups()
                    matches.append((rev, current_filename, author, line))
                else:
                    print(line)
    except: 
        print(linecount)

file_lines = defaultdict(list)

for (rev, filename, author, line) in matches:
    if line.isspace() or line == "":
        continue
    
    file_lines[filename].append((rev,author,line))

file_stats = defaultdict(lambda: {"authors": defaultdict(lambda: 0), "total": 0})

for (filename, lines) in file_lines.items():
    for (rev, author, line) in lines:
        file_stats[filename]["authors"][author] += 1
        file_stats[filename]["total"] += 1

file_ownership = {}
total_stats = defaultdict(lambda: defaultdict(lambda: 0))

suffix_map = {
    ".sqf": "sqf",
    ".hpp": "config",
    ".cpp'": "config"
}

for (filename, info) in file_stats.items():
    total_lines = info["total"]
    #print(f"{filename} - (Total: {total_lines})")

    suffix = PurePath(filename).suffix.strip()
    filetype = suffix_map.get(suffix, "other")

    winning_author = ""
    winning_author_amount = 0

    for (author, author_total) in info["authors"].items():
        total_stats[filetype][author] += author_total
        total_stats["overall"][author] += author_total

        if author_total > winning_author_amount:
            winning_author = author
            winning_author_amount = author_total

    file_ownership[filename] = (winning_author, winning_author_amount / info["total"])
        
for (filename, (owner, percentage)) in file_ownership.items():
    #if owner != "vbawol": continue
    formatted_percentage = "{:.0%}".format(percentage)
    print(f"{filename}: {owner} ({formatted_percentage}) ")

for (filetype, authors) in total_stats.items():
    print(f"Filetype: {filetype}")
    for (author, count) in authors.items():
        print(f"  Author: {author}, Total Lines: {count}")