namespace :states do
  desc "Seed States names"
  task seed_states: :environment do
    State.create!([{
      name: "Alabama, AL"
    },
    {
      name: "Alaska, AK"
    },
    {
      name: "Arizona, AZ"
    },
    {
      name: "Arkansas, AR"
    },
    {
      name: "California, CA"
    },
    {
      name: "Colorado, CO"
    },
    {
      name: "Connecticut, CT"
    },
    {
      name: "Delaware, DE"
    },
    {
      name: "District of Columbia, DC"
    },
    {
      name: "Iowa, IA"
    },
    {
      name: "Kansas, KS"
    },
    {
      name: "Kentucky, KY"
    },
    {
      name: "Louisiana, LA"
    },
    {
      name: "Maine, ME"
    },
    {
      name: "Maryland, MD"
    },
    {
      name: "Massachusetts, MA"
    },
    {
      name: "Michigan, MI"
    },
    {
      name: "Minnesota, MN"
    },
    {
      name: "Mississippi, MS"
    },
    {
      name: "Missouri, MO"
    },
    {
      name: "Montana, MT"
    },
    {
      name: "Nebraska, NE"
    },
    {
      name: "Nevada, NV"
    },
    {
      name: "New Hampshire, NH"
    },
    {
      name: "New Jersey, NJ"
    },
    {
      name: "New York, NY"
    },
    {
      name: "North Carolina, NC"
    },
    {
      name: "North Dakota, ND"
    },
    {
      name: "Ohio, OH"
    },
    {
      name: "Oklahoma, OK"
    },
    {
      name: "Oregon, OR"
    },
    {
      name: "Pennsylvania, PA"
    },
    {
      name: "Puerto Rico, PR"
    },
    {
      name: "Rhode Island, RI"
    },
    {
      name: "South Carolina, SC"
    },
    {
      name: "South Dakota, SD"
    },
    {
      name: "Tennessee, TN"
    },
    {
      name: "Texas, TX"
    },
    {
      name: "Utah, UT"
    },
    {
      name: "Vermont, VT"
    },
    {
      name: "Virginia, VA"
    },
    {
      name: "Washington, WA"
    },
    {
      name: "West Virginia, WV"
    },
    {
      name: "Wisconsin, WI"
    },
    {
      name: "Wyoming, WY"
    },
  ])
  end

  p "Created #{State.count} states"
end
