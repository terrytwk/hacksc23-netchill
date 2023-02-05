const prisma = require("../config/db");

const getCategories = async () => {
  return await prisma.category.findMany({});
}

const getContacts = async (id) => {
  return await prisma.user.findUnique({
    where: {
      id
    },
    select: {
      contacts: {
        include: {
          related_user: {
            include: {
              career_tags: {
                include: {
                  tag: true
                }
              },
              hobby_tags: {
                include: {
                  tag: true
                }
              }
            }
          },
          match: {
            select: {
              assignedAt: true
            }
          },
          category: {
            select: {
              description: true
            }
          }
        }
      }
    }
  })
}

const createContact = async (
  relating_user_id,
  related_user_id,
  notes,
  contact_frequency,
  category_id,
  match_id
) => {
  return await prisma.contact.create({
    data: {
        relating_user_id,
        related_user_id,
        notes,
        contact_frequency,
        category_id,
        match_id
    },
    include: {
      related_user: {
        include: {
          career_tags: {
            include: {
              tag: true
            }
          },
          hobby_tags: {
            include: {
              tag: true
            }
          }
        }
      },
      match: {
        select: {
          assignedAt: true
        }
      },
      category: {
        select: {
          description: true
        }
      }
    }
  })
};

const updateContact = async (
  id,
  notes,
  contact_frequency,
  category_id
) => {
  return await prisma.contact.update({
    where: {
      id
    },
    data: {
        notes,
        contact_frequency,
        category_id
    },
    include: {
      category: {
        select: {
          description: true
        }
      }
    }
  })
};

const deleteContact = async (id) => {
  return await prisma.contact.delete({
    where: {
      id
    }
  })
}


module.exports = { getCategories, getContacts, createContact, updateContact, deleteContact };
