import { DataTypes, Model, Optional } from 'sequelize'
import { IOrganization } from '../types'
import { sequelize } from '.'

// Sequelized Model Basics https://sequelize.org/master/manual/model-basics.html
// Sequelized TypeScript Guide https://sequelize.org/master/manual/typescript.html

type OrganizationAttributes = IOrganization
type OrganizationCreationAttributes = Optional<OrganizationAttributes, 'id'>
export class Organization
  extends Model<OrganizationAttributes, OrganizationCreationAttributes>
  implements IOrganization {
  id!: string
}

Organization.init(
  {
    id: {
      type: DataTypes.STRING(32),
      primaryKey: true,
    },
  },
  {
    sequelize,
    tableName: 'organizations',
  }
)
