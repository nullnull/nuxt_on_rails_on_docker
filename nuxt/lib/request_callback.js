import axios from 'axios'
import pluralize from 'pluralize'

const actionToMethod = {
  index: 'get',
  show: 'get',
  create: 'post',
  edit: 'get',
  update: 'put',
  destroy: 'delete'
}

const getQueryStrings = query => {
  return query
    ? '?' +
        Object.entries(query)
          .map(([k, v]) => `${k}=${v}`)
          .join('&')
    : ''
}

export default async (action, resource, query, headers, options, obj = {}) => {
  const apiUrl = process.env.apiUrl
  const method = actionToMethod[action]

  if (action === 'index') {
    return await axios[method](
      `${apiUrl}/${pluralize(resource)}${getQueryStrings(query)}`,
      {
        headers: headers
      }
    )
  } else if (['create'].includes(action)) {
    return await axios[method](`${apiUrl}/${pluralize(resource)}`, obj, {
      headers: headers
    })
  } else if (['show', 'destroy'].includes(action)) {
    const path = options.isSingular
      ? resource
      : `${pluralize(resource)}/${query.id}`
    return await axios[method](`${apiUrl}/${path}`, {
      headers: headers
    })
  } else if (['edit'].includes(action)) {
    const path = options.isSingular
      ? `${pluralize(resource)}/edit`
      : `${pluralize(resource)}/${query.id}/edit`
    return await axios[method](`${apiUrl}/${path}`, {
      headers: headers
    })
  } else if (['update'].includes(action)) {
    const path = options.isSingular
      ? `${pluralize(resource)}`
      : `${pluralize(resource)}/${query.id}`
    return await axios[method](`${apiUrl}/${path}`, obj, {
      headers: headers
    })
  } else {
    throw 'Undefined action'
  }
}
