# Wikipedia Ruby Xml Lab

## Objectives

1. Parse XML with Ruby
2. Write to a Text File
3. Correlate Data from Different Sources

## Instructions

Write a ruby program `wikipedia_processor.rb` to process `enwiki-latest-stub-articles1.xml` file for the following tasks:

### 1. Collect all Page Ids and Titles

Collect all page ids and title names for pages whose title starts with either `"Afghanistan"` or `"America."`

Write this information into a file named `pages.txt` in the following format: `<page id>, <page title>`

### 2. Find Contributor `username` and `id`

For each of those in task 1 above, find contributor `username` and the corresponding `id`. 

Write this information into a file named `users.txt` in the following format: `<contributor id>`, `<contributor name>`

### 3. Get the page id and contributor id

From tasks 1 and 2 above, get the page id and contributor id, and write into the file named `page_users.txt` in the following format: <page id>, <conributor id>

### 4. Page count

Build a method, `page_count`, the returns the number of pages which start with either "Afghanistan" or "America" (case sensitive).

**Note: There are some pages that do not have usernames for contributors; ignore task 2 and 3 for such cases e.g.: <title>Afghanistan (1911 Encyclopedia)</title> has contributor <ip>96.251.199.116</ip>; i.e., it does not have username and userid.**

## Using Nokogiri

[`nokogiri`](http://www.nokogiri.org/tutorials/parsing_an_html_xml_document.html) is a Ruby gem for parsing XML and it has been included in the `Gemfile` of this project.

Sample usage:

```ruby
xml = <<-XML
<root>
  <sitcoms>
    <sitcom>
      <name>Married with Children</name>
      <characters>
        <character>Al Bundy</character>
        <character>Bud Bundy</character>
        <character>Marcy Darcy</character>
      </characters>
    </sitcom>
    <sitcom>
      <name>Perfect Strangers</name>
      <characters>
        <character>Larry Appleton</character>
        <character>Balki Bartokomous</character>
      </characters>
    </sitcom>
  </sitcoms>
  <dramas>
    <drama>
      <name>The A-Team</name>
      <characters>
        <character>John "Hannibal" Smith</character>
        <character>Templeton "Face" Peck</character>
        <character>"B.A." Baracus</character>
        <character>"Howling Mad" Murdock</character>
      </characters>
    </drama>
  </dramas>
</root>
XML

@doc = Nokogiri::XML(xml)
@doc.xpath("//character")
# => ["<character>Al Bundy</character>",
#    "<character>Bud Bundy</character>",
#    "<character>Marcy Darcy</character>",
#    "<character>Larry Appleton</character>",
#    "<character>Balki Bartokomous</character>",
#    "<character>John \"Hannibal\" Smith</character>",
#    "<character>Templeton \"Face\" Peck</character>",
#    "<character>\"B.A.\" Baracus</character>",
#    "<character>\"Howling Mad\" Murdock</character>"]
```

## Resources

1. [Searching a Document](http://www.nokogiri.org/tutorials/searching_a_xml_html_document.html)
2. [Writing a File in Ruby](https://www.codecademy.com/pt-BR/articles/writing-to-file-ruby)