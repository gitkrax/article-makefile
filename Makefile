
# Change these if needed: first is the source file, others are templates used
SOURCE = $(wildcard *.md) # try to convert any .md files in the folder
DOCXTEMPLATE = digra-template.docx # .docx-file used as a reference
PDFTEMPLATE = article.latex # the default latex template

# Just the file name, no extension
SOURCEBASENAME = $(basename $(SOURCE))

# Assume that images are in folder 'img' and either .jpg or .png files
IMG = $(wildcard *.jpg *.png)
IMGFOLDER = $(addprefix $(IMG))

pdf:	$(SOURCE) $(IMG)
	pandoc \
	--smart \
	--normalize \
	--template=$(PDFTEMPLATE) \
	--filter pandoc-citeproc \
	$< -o $(SOURCEBASENAME).pdf

docx:	$(SOURCE) $(IMG)
	pandoc \
	--smart \
	--normalize \
	--reference-docx=$(DOCXTEMPLATE) \
	--filter pandoc-citeproc \
	$< -o $(SOURCEBASENAME).docx

all:	docx pdf
