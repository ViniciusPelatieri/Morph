unit Morph.Messages;

interface

const MORPH_MESSAGE_FIELD_DUPLICATE = 'Field %s already exists.';
const MORPH_MESSAGE_FIELD_NOT_FOUND = 'Field %s does not exists in table %s.';
const MORPH_MESSAGE_PROPERTY_NOT_FOUND = 'Property %s not found.';
const MORPH_MESSAGE_WRONG_PROPERTY_TYPE = 'Wrong property (%s) type - not %s.';
const MORPH_MESSAGE_NOT_VALID_FIELD_IDENTIFICATOR = 'Not valid field identificator: %s.';
const MORPH_MESSAGE_PSQL_EXCEPTION = 'The PSQL: "%s" has generated the exception: "%s"';
const MORPH_MESSAGE_INVALID_JSON_OBJECT = 'The provided string is not a valid JSON object with JSON object array inside.';
const MORPH_MESSAGE_EMPTY_INSERT_JSON = 'The provided JSON has no data to be inserted in chosen table.';
const MORPH_MESSAGE_UNSUPORTED_FIELD_TYPE = 'The %s field type is not suported by morph.';
const MORPH_MESSAGE_COULD_NOT_DETTECT_TYPE = 'Morph was not capable of guessing the type of value %s.';

implementation

end.
