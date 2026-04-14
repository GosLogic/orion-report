import glob

report_path = "Report.md"
export_path = "Report.md"
chapter_path = "[0-9]*.md"

files = sorted(glob.glob(chapter_path))

with open(export_path, "w", encoding="utf-8") as outfile:
    for i,filename in enumerate(files):
        with open(filename, "r", encoding="utf-8") as infile:
            outfile.write(infile.read())
            outfile.write("\n\n---\n\n")
            if i < len(files) - 1:
                outfile.write("\n\n<div style=\"page-break-after: always;\"></div>\n\n")

    