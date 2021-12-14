import React, { useState } from 'react';
import { Form, Button, Card, Alert, Container } from 'react-bootstrap';
import { useForm } from 'react-hook-form';
import { Link, useNavigate } from 'react-router-dom';
import { ROUTES } from '../../consts/consts';

export const ProfileUpdatePage = () => {
  // const { user, updatePassword, updateEmail, updateProfile } = useAuth();
  const user = {};

  // const updatePassword = password => updatePasswordFirebase(auth.currentUser, password);

  // const updateEmail = email => updateEmailFirebase(auth.currentUser, email);

  // const updateProfile = data => updateProfileFirebase(auth.currentUser, data);

  const navigate = useNavigate();

  const { register, handleSubmit } = useForm();
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const onSubmit = (data, e) => {
    e.preventDefault();
    const { email, password, confirmPassword, displayName, photoURL } = data;

    const promises = [];
    setLoading(true);
    setError('');

    if (password !== confirmPassword) {
      return setError('Passwords do not match');
    } else if (password) {
      promises.push(updatePassword(password));
    } else if (email !== user?.email) {
      promises.push(updateEmail(email));
    } else if (displayName || photoURL) {
      const data = {};

      if (displayName) {
        data.displayName = displayName;
      }

      if (photoURL) {
        data.photoURL = photoURL;
      }

      promises.push(updateProfile(data));
    }

    Promise.all(promises)
      .then(() => {
        navigate(ROUTES.PROFILE);
      })
      .catch(() => {
        setError('Failed to update account');
      })
      .finally(() => {
        setLoading(false);
      });
  };

  return (
    <Container className="mt-4 d-flex justify-content-center">
      <Card className="w-50">
        <Card.Body>
          <h2 className="text-center mb-4">Update Profile</h2>
          {error && <Alert variant="danger">{error}</Alert>}
          <Form onSubmit={handleSubmit(onSubmit)}>
            <Form.Group className="mt-2" id="email">
              <Form.Label>Email</Form.Label>
              <Form.Control
                type="email"
                {...register('email', {
                  required: true,
                })}
                defaultValue={user?.email}
              />
            </Form.Group>
            <Form.Group className="mt-2" id="displayName">
              <Form.Label>User name</Form.Label>
              <Form.Control type="text" {...register('displayName')} />
            </Form.Group>
            <Form.Group className="mt-2" id="photoURL">
              <Form.Label>User avatar</Form.Label>
              <Form.Control
                type="text"
                {...register('photoURL')}
                placeholder="Enter image url"
              />
            </Form.Group>
            <Form.Group className="mt-2" id="password">
              <Form.Label>Password</Form.Label>
              <Form.Control type="password" {...register('password')} />
            </Form.Group>
            <Form.Group className="mt-2" id="password-confirm">
              <Form.Label>Password Confirmation</Form.Label>
              <Form.Control type="password" {...register('confirmPassword')} />
            </Form.Group>
            <Button
              disabled={loading}
              className="w-100 btn-danger mt-3"
              type="submit"
            >
              Update
            </Button>
            <Link to={ROUTES.PROFILE}>
              <Button className="w-100 btn-danger mt-3">Cancel</Button>
            </Link>
          </Form>
        </Card.Body>
      </Card>
    </Container>
  );
};
