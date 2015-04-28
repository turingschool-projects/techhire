# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Pdfs
pdf = Pdf.create(slot: 1)
pdf.pdf_file = File.open("public/assets/pdfs/sample_pdf.pdf")
pdf.save

# Cities
Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "Kentucky",
  city: "Louisville",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "New York City",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
  )

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "Philadelphia",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
  )

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "City of Kearney and Buffalo County",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
  )

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "St. Louis",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
  )

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "Salt Lake City",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
  )

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "San Antonio",
  email: "email@email.com",
  hiring: true,
hire_count: 100
)

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "Los Angeles",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "Minneapolis",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "Kansas City",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "Memphis",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "Kentucky",
  city: "Eastern Kentucky",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)
Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "Nashville",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)


Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "Rochester",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)
Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "Detroit",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "San Francisco",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "Albuquerque",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "state",
  city: "Chattanooga",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "Oregon",
  city: "Portland",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "Delware",
  city: "Dover",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)

Company.create(
  name: "company",
  organization: "org",
  title: "title",
  state: "Alaska",
  city: "Anchorage",
  email: "email@email.com",
  hiring: true,
  hire_count: 100
)
