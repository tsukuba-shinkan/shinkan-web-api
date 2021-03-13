/**
 * v2.Organization
 */
// export interface IOrganization {
//   id: string
//   name: string
//   createdAt: Date
//   updatedAt: Date
// }

export interface IOrganization {
  id: string //numberではなく？
  name: string
  title: string
  mainImageURL: string
  organizationType: string
  activityType: string
  createdAt: Date
  updatedAt: Date
}

/**
 * v2.Introductions
 */
export interface IIntroduction {
  id: number
  title: string
  name: string
  activityIntroduction: string
  website: string
  twitter: string
  instagram: string
  mainImageURL: string
  otherImageURLs: string[]
  youtubeLinks: string[]
  status: string
  createdAt: string
  updatedAt: string
}

/**
 * v2.Events
 */
export interface event {
  id: number
  title: string
  detail: string
  start: string // ISO DateTime
  end: string // ISO DateTime
  status: string
  organizationID: number
  createdAt: string
  updatedAt: string
}

/**
 * v2.Reviews
 */
export interface Review {
  id: number
  type: string //"introduction" or "event"
  contentID: number
  result: string
  reason: string
  createdAt: string
  updatedAt: string
}

/**
 * v2.Pages
 */
export interface Page {
  id: number
  slug: string
  title: string
  content: string
  isPublished: boolean
  createdAt: string
  updatedAt: string
}

/**
 * v2.Announcements
 */
export interface Announcement {
  id: number
  title: string
  content: string
  isPublished: boolean
  createdAt: string
  updatedAt: string
}

/**
 * v2.Users
 */
export interface User {
  userID: string
  name: string
  authority: string
  email: string
  organizationID: number[]
  createdAt: string
  updatedAt: string
}

/**
 * v2.Memberships
 */
export interface Membership {
  organizationID: number
  userID: string
  name: string
  email: string
  createdAt: string
  updatedAt: string
}

/**
 * v2.Invitations
 */
export interface Invitation {
  invitationID: number
  email: string
  organizationID: string
  createdAt: string
  updatedAt: string
}
