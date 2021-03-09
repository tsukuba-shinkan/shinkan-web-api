import { IOrganization } from '../types'

export class Organization implements IOrganization {
  private _id!: string
  private _name!: string
  createdAt!: Date
  updatedAt!: Date

  constructor(props: IOrganization) {
    this.set(props)
  }

  /**
   * プロパティをオブジェクトから設定する
   * @param props
   */
  private set(props: Partial<IOrganization>): void {
    this.id = props.id || this.id
    this.name = props.name || this.name
    this.createdAt = props.createdAt || this.createdAt
    this.updatedAt = props.updatedAt || this.updatedAt
  }

  get id(): string {
    return this._id
  }

  set id(id: string) {
    // To be implemented: Perform validation
    this._id = id
  }

  get name(): string {
    return this._name
  }

  set name(name: string) {
    // To be implemented: Perform validation
    this._name = name
  }

  /**
   * Organizationレコードを新規作成する
   * @param props
   */
  static async create(
    props: Omit<IOrganization, 'id' | 'createdAt' | 'updatedAt'>
  ): Promise<Organization> {
    // To be implemented: Perform insert query (async)

    return new Organization({
      id: '__ID_FROM_DB__',
      name: props.name,
      createdAt: new Date(),
      updatedAt: new Date(),
    })
  }

  /**
   * Organizaionレコードを更新する
   */
  async update(): Promise<void> {
    // To be implemented: Perform update query (async)
  }
}
